# Diceware passphrase generator
[**GITHUB repo**](https://github.com/jonathanyeong/diceware_passphrase_gen)
I want to build this... maybe in JS?

We take a list of key value pairs -> https://theworld.com/%7Ereinhold/diceware.wordlist.asc

We generate 5 random numbers (between 1-6 each)

We allow the user to choose the number of words

We allow the user to choose the delimiter between each word (space, asterik, number etc)

## Vue notes

data.message doesn't seem like a variable for example:

```
 <div id="app">
    {{ message }}
    {{ message2 }}
  </div>

  var app = new Vue({
    el: '#app',
    data: {
      message: 'Hello World!',
      mesage2: 'Another message'
    }
  })
```

Doesn't show the second message.

---

`v-bind` is a directive. All directives are prefixed with `v-`. Directives apply special reactive behavior to the rendered DOM.

---
`v-for` could help with the diceware project. We could use this to loop over a csv.

---
`v-model` directive makes a two way binding between form input and app state.

---
Use components in Vue to build up an interface. Almost any type of application interface can be abstracted into a tree of components.

---
A `prop` is like a custom attribute.

---
MVMM Model (Model - View - ViewModel) - ViewModel is a value converter. It is responsible for exposing (converting) the data from the model in such a way that objects are easily managed and presented.

The key diff between this and a controller is that the MVVM pattern has a binder, which automates communication b etween the view and its bound props in the view model. The view model is described as a state of the data in the model.

---

What is the reactivity system? When a vue instance is created, all props found in `data` will be added to the reactivity system. Anytime those values change, the view will "react", updating to match the new values.

**NOTE**: Props in `data` are only reactive if they exited when the instance was created. If you need that prop later, you should set an initial value when initializing the vue instance.

---

40 minutes into the tutorial, I realized there's a Vue 3 coming out...

Might as well start using that! Unfortunately, I don't know how much my knowledge from the previous tutorial will apply to Vue 3.

## Vue 3 Notes
You need to call `mount` after you create app. I guess this is in place of the lifecycle call backs. It seems like you have a bit more control this way.

---
Shorthand for `v-bind` == `:`
Shorthand for `v-on` == `@`
## Resources

- [Setting up Vue Project](https://medium.com/@subodhgarg/how-to-set-up-vue-js-project-in-5-easy-steps-using-vue-cli-669b1aea518b)
- [MVVM pattern](https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93viewmodel)