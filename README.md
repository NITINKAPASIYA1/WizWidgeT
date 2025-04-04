Steps to Run the Streak Counter Widget

Setup the Project

Clone or download the project from the repository
Open the project in Xcode 15 or later
Ensure you have iOS 16+ device or simulator ready


Configure App Groups

Select both main app target and widget extension target
Add "App Groups" capability to both targets
Create an identifier like "group.com.yourname.streakcounter"
Make sure the same app group is selected for both targets


Build and Run the Main App

Select your device/simulator
Build and run the main app first to initialize UserDefaults
Test the streak counter functionality within the app
Increment/decrement the counter to ensure it's working


Add the Widget to Home Screen

Long press on the home screen
Tap the "+" button in the top corner
Find "Streak Counter" in the widget gallery
Select the small widget size and add to home screen
The widget should display your current streak count


Test the Integration

Modify the streak count in the main app
Check if the widget updates (refresh occurs every 15 minutes)
For immediate updates, you can force quit both app and widget
Verify animations and UI transitions work as expected
