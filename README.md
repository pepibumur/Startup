![logo](Assets/logo.png)

<p align="center">
    <a href="https://cocoapods.org/pods/Startup">
        <img src="https://img.shields.io/cocoapods/v/Startup.svg" alt="CocoaPods" />
    </a>
    <a href="https://github.com/Carthage/Carthage">
        <img src="https://img.shields.io/badge/carthage-compatible-4BC51D.svg?style=flat" alt="Carthage" />
    </a>
    <a href="https://swift.org/package-manager">
        <img src="https://img.shields.io/badge/spm-compatible-brightgreen.svg?style=flat" alt="Swift Package Manager" />
    </a>
    <a href="https://twitter.com/pepibumur">
        <img src="https://img.shields.io/badge/contact-@pepibumur-blue.svg?style=flat" alt="Twitter: @pepibumur" />
    </a>
</p>

Startup is a Swift library that provides you with declarative components for defining your application startup operations.

### Motivation
When our apps start, they need to perform some operations before the user can start using them. These operations can be a database setup, initialization of external services, cleaning up of data... Although some of the operations are not expensive, some others require some time to get executed. In that scenario, we could use `NSOperation` API to paralellize the execution of these operations, defining dependencies between them, but we'd most likely end up with a complex setup, hard to read and maintain.

**Startup provides you with a very nice API for defining the operations, dependencies and their execution in different threads**

## How to use the library
The library is distributed using CocoaPods, so you just need to update your project `Podfile` and add:

```ruby
pod "Startup"
```

After that, you can fetch and add the dependency to your project with `pod install`

If you are using [Carthage](https://github.com/carthage/carthage) you can add the following line to your `Cartfile`:

```ruby
github "pepibumur/Startup"
```

And execute `carthage build`

## References

- [SwiftPlate](https://github.com/JohnSundell/SwiftPlate): Very useful command line tool for automating the creation of Swift projects.

## LICENSE

```
Copyright 2017 ppinera.es

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
```