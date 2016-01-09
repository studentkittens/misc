package main

import (
	"fmt"
	"html/template"
	"image/color"
	"io"
	"net/http"
	"os/exec"
	"runtime"
	"strings"
)

func calculateColors() []color.RGBA {
	colors := make([]color.RGBA, 0)
	for h := 0; h < 256; h += 32 {
		for s := 0; s < 256; s += 32 {
			for v := 64; v < 256; v += 64 {
				r, g, b := HSLToRGB(float64(h)/255, float64(s)/255, float64(v)/255)
				colors = append(colors, color.RGBA{r, g, b, 255})
			}
		}
	}
	return colors
}

type Kernel struct {
	Name string
	Arch string
}

func createTemplate(path string) *template.Template {
	tmpl, err := template.ParseFiles(path)
	if err != nil {
		fmt.Println("Template broken:", err)
		return nil
	}

	return tmpl
}

func renderTemplate(tmpl *template.Template, w http.ResponseWriter, params interface{}) {
	if err := tmpl.Execute(w, params); err != nil {
		fmt.Println("Cannot render template:", err)
	}
}

func createCatlight() (io.WriteCloser, error) {
	cmd := exec.Command("catlight", "cat")
	pipe, err := cmd.StdinPipe()
	if err != nil {
		return nil, err
	}

	return pipe, cmd.Start()
}

func main() {
	tmpl_uname := createTemplate("templates/uname.html")
	tmpl_box := createTemplate("templates/colorbox.html")

	pipe, err := createCatlight()
	if err != nil {
		fmt.Println("Creating catlight failed:", err)
		return
	}

	http.HandleFunc("/colorwall", func(w http.ResponseWriter, r *http.Request) {
		r.Header.Set("Content-Type", "text/html")
		renderTemplate(tmpl_box, w, calculateColors())
	})

	http.HandleFunc("/uname", func(w http.ResponseWriter, r *http.Request) {
		renderTemplate(tmpl_uname, w, Kernel{Name: runtime.GOOS, Arch: runtime.GOARCH})
	})

	http.HandleFunc("/rgb/", func(w http.ResponseWriter, rq *http.Request) {
		pipe.Write([]byte(strings.Replace(rq.URL.Path[5:], "/", " ", -1) + "\n"))
		http.Redirect(w, rq, "/colorwall", http.StatusFound)
	})

	http.ListenAndServe(":7000", nil)
}
