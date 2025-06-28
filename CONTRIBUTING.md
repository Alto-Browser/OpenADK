
# Contributing to OpenADK

OpenADK is the open source framework behind Alto, but it is designed to be browser agnostic so it can be used in any webkit based browser prototype

## Specific improvements needed

The OpenADK framork has some major limitations that need to be worked on. here are a few that you could work on

1. Add a tab saving system that stores tabs in JSON format for storage and reteaval (should suport split views and folders as well as spaces)
2. Impliment a better Preference system that is browser agnostic and allows for observation without as much convoluted code (look at Defaults Package)
3. Have the background for a webview be the color of the page background to avoid grey bars when resizing
4. Fix any bugs

# Development

## Forking

Create a fork of OpenADK as well as Alto to test changes, all changes made to OpenADK need to work with Alto.

First navigate to the directory you want to clone the repositorys into. Then clone the forks of the repositorys onto your local computer.

```sh
git clone https://github.com/{Github_Username}/OpenADK
git clone https://github.com/{Github_Username}/Alto
```

After cloning the repositories localy Create a Workspace file to develop with both repositories at the same time. To work on both projects on the same time open the workspace file and drag the Xcode Project file with the `.xcodeproj` file ending for both projects into the workspace. 

## Now what?

after having forked the project and having opened it in a workspace file you will still need to change the certifications of the project to match your own or the code will not compile. click on the alto project and change the team to yourself under the signing and capabilities tab.

Now you are done! you should be able to compile and run the project as well as make edits. push local changes to you github branch then open a PR once your changes are done or open a draft PR if you need to workshop the code before it is merged

## Contribution Expectations

Good! You now know how to contribute, but you also need to know the expectations for how code for the project is formated. 

### SwiftFormat

Code submited to the project needs to be formated using SwiftFormat. SwiftFormat will automaticly lint your code to ensure that the format is standerdized across the codebase.

How to install SwiftFormat:

First you will need to install `brew`

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
Then using brew install SwiftFormat.

```sh
brew install SwiftFormat
```

To use SwiftFormat run ` SwiftFormat .` in the projects directory via the terminal

### Code Expectations

Code submited to either Alto or OpenADK should conform to the following expectations

1. The code uses MVVM
2. The code conforms to the existing folder structure
3. The code is well comented

### Commenting Expectations

The code you submit to the project should de commented to ensure readability for other contributers. An example of this would be:

```swift
// MARK: - ADKState

/// ADKState provides a state for each window specificaly
/// Allows each window to display a diferent view of the tabs
@Observable
open class ADKState: ADKStateRepresentable {
    // MARK: - Peramaters

    public var id = UUID()
    public var tabManager: ADKTabManager
```
