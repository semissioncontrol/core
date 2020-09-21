package main

import(
	"fmt"
	"os/exec"
	"bytes"
)

func main(){
	cargoBuild := exec.Command("cargo", "build", "--manifest-path=/semc/src/logger/Cargo.toml")
	err := cargoBuild.Run()
	if err != nil {
		fmt.Println(err)
	}

	loggerInit := exec.Command("/semc/src/logger/target/debug/logger")
	var out bytes.Buffer
	loggerInit.Stdout = &out
	err = loggerInit.Run()
	if err != nil {
		fmt.Println(err)
	}
	fmt.Printf(out.String())

}
