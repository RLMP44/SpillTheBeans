// Import and register all your controllers from the importmap under controllers/*
// must register all javascript controllers individually

import { application } from "./application"

import HelloController from "./hello_controller.js"
application.register("hello", HelloController)
import ReactController from "./react_controller.js"
application.register("react", ReactController)

// Lazy load controllers as they appear in the DOM (remember not to preload controllers in import map!)
// import { lazyLoadControllersFrom } from "@hotwired/stimulus-loading"
// lazyLoadControllersFrom("controllers", application)

// can now use the below in html
// <div data-controller="hello">
//   <span data-hello-target="output"></span>
// </div>
