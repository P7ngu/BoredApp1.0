//
//  ChallengeViewModel.swift
//  Bored
//
//  Created by Matteo Perotta on 19/10/23.
//

import Foundation
import SwiftUI

class ChallengeViewModel{
    var todaysChallenge = Challenge(name: "error", content: "error")
    
    func getTodaysChallenge() -> Challenge{
        var currentDate = Time().getCurrentDate()
        
        for challenge in challenges {
            //print("for iteration")
            if (challenge.assignedDate == currentDate)
            {
                print("date match found")
                todaysChallenge = challenge
                return todaysChallenge
            }else{}
                
        }
        
        return todaysChallenge
        
    }
    
    var challenges = [
    Challenge(name: "Nature Walking", content: "For this challenge you need to... Take a short walk in a nearby park or garden, snap a photo of something in nature, and reflect on how it made you feel", completed: true, assignedDate: "01"),
    Challenge(name: "Morning Coffee", content: "For this challenge you need to... Enjoy your morning beverage, capture the moment with a photo, and reflect on the calmness it brings to your day.", completed: true, assignedDate: "02"),
    Challenge(name: "Doodle or Sketch", content: "For this challenge you need to... Spend a few minutes drawing something simple, take a photo of your creation, and reflect on the creative process", assignedDate: "03"),
    Challenge(name: "Healthy Snack", content: "For this challenge you need to... Prepare a quick, healthy snack, photograph it, and reflect on the importance of nourishing your body.", assignedDate: "04"),
    Challenge(name: "Sunset/Sunrise", content: "For this challenge you need to... Take a photo of the sunset or sunrise and reflect on the beauty of the natural world.", assignedDate: "05"),
    Challenge(name: "Favourite Book Page", content: "For this challenge you need to... Open your favourite book to a random page, read a passage, take a photo, and reflect on the words' meaning in your life.", assignedDate: "06"),
    Challenge(name: "Yoga or Stretching", content: "For this challenge you need to... Do a quick yoga pose or stretching routine, photograph yourself in the pose, and reflect on the sense of well-being it brings.", assignedDate: "07"),
    Challenge(name: "Write a Haiku", content: "For this challenge you need to... Write a short haiku poem, take a photo that complements it, and reflect on the emotions it conveys.", assignedDate: "08"),
    Challenge(name: "Plant Care", content: "For this challenge you need to... Water a houseplant or tend to your garden, snap a photo of the plant, and reflect on the satisfaction of nurturing life.", assignedDate: "09"),
    Challenge(name: "Puzzle Progress", content: "For this challenge you need to... Work on a jigsaw puzzle for a few minutes, take a picture of your progress, and reflect on the patience and problem-solving involved.", assignedDate: "10"),
    Challenge(name: "Mini Meditation", content: "For this challenge you need to... Take a brief meditation break, photograph a tranquil moment, and reflect on the mental clarity it provides.", assignedDate: "11"),
    Challenge(name: "Family Time", content: "For this challenge you need to... Spend quality time with a family member, capture a candid moment, and reflect on the bonds that connect you.", assignedDate: "12"),
    Challenge(name: "Inspirational Quote", content: "For this challenge you need to... Find an inspirational quote, write it down, take a photo, and reflect on its relevance in your life.", assignedDate: "13"),
    Challenge(name: "Dance Break", content: "For this challenge you need to... Put on your favourite song, dance for a few minutes, take a fun dance photo, and reflect on the joy it brings.", assignedDate: "14"),
    Challenge(name: "Mindfulness Moment", content: "For this challenge you need to... Practice a quick mindfulness exercise, photograph something that symbolises the present moment, and reflect on the peace it brings", assignedDate: "15"),
    Challenge(name: "Cloud Watching", content: "For this challenge you need to... Lie on the grass and watch the clouds, snap a picture of an interesting cloud formation, and reflect on the beauty of the sky.", assignedDate: "16"),
    Challenge(name: "Mindful Breathing", content: "For this challenge you need to... Take a few minutes to focus on your breath, capture an image of a serene scene, and reflect on the power of mindfulness.", assignedDate: "17"),
    Challenge(name: "Window View", content: "For this challenge you need to... Look out your window and photograph whatever catches your eye, then reflect on how it connects you to the outside world.", assignedDate: "18"),
    Challenge(name: "Sudoku or Crossword", content: "For this challenge you need to... Solve a quick puzzle, take a photo of your progress, and reflect on the mental challenge and satisfaction of problem-solving and reflect on the creative process.", assignedDate: "19"),
    Challenge(name: "Hobby Time", content: "For this challenge you need to... Spend a few minutes on your favourite hobby (e.g., knitting, model-building), take a picture of your work, and reflect on the pleasure it brings.", assignedDate: "20"),
    Challenge(name: "Travel Memory", content: "For this challenge you need to... Look through your travel photos and choose one, then reflect on the memories and experiences associated with that place.", assignedDate: "21"),
    Challenge(name: "Garden Snapshot", content: "For this challenge you need to... Capture a picture of a beautiful flower or plant, and reflect on the satisfaction of gardening", assignedDate: "22"),
    Challenge(name: "Gratitude Journal", content: "For this challenge you need to... Write down one thing you're grateful for, photograph your journal entry, and reflect on the positivity in your life.", assignedDate: "23"),
    Challenge(name: "Handwritten Note", content: "For this challenge you need to...  Write a short note to someone you care about, take a photo of the note, and reflect on the impact of personal connections.", assignedDate: "24"),
    Challenge(name: "Flipping a Coin Decision", content: "For this challenge you need to... Flip a coin for a decision, capture the coin in mid-air, and reflect on your intuition and the outcome.", assignedDate: "25"),
    Challenge(name: "Shadow Play", content: "For this challenge you need to... Stand in the sunlight and take a photo of your shadow, then reflect on the interplay of light and shadow.", assignedDate: "26"),
    Challenge(name: "Favourite Art Piece", content: "For this challenge you need to... Spend a few minutes looking at a piece of art you love, photograph it, and reflect on the emotions it evokes.", assignedDate: "27"),
    Challenge(name: "Desk Tidy-Up", content: "For this challenge you need to... Quickly organise your workspace, take a photo of the tidy result, and reflect on the impact of a clean and organised environment.", assignedDate: "28"),
    
    Challenge(name: "DIY Craft", content: "For this challenge you need to... Start a small do-it-yourself craft project, photograph the materials or your progress, and reflect on your creativity and resourcefulness.", assignedDate: "29"),
    Challenge(name: "Music Break", content: "For this challenge you need to... Listen to  your favourite song or piece of music, capture a screenshot of the cover art, and reflect on the emotions it brings.", assignedDate: "30"),
    Challenge(name: "Star Gazing", content: "For this challenge you need to... Go outside to gaze at the stars, take a photo of the night sky, and reflect on the vastness of the universe.", assignedDate: "31"),
    
    
    // unassigned challenges
    Challenge(name: "Mini Time Capsule", content: "For this challenge you need to... Collect a few small items from your day, place them in a container, take a photo of the contents, and reflect on the significance of these items."),
    Challenge(name: "Random Page from a Magazine", content: "For this challenge you need to... Open a magazine to a random page, take a photo, and reflect on the message or image that catches your eye."),
    Challenge(name: "Post-It Note Affirmation", content: "For this challenge you need to... Write a positive affirmation on a Post-It note, stick it on your mirror, photograph it, and reflect on the power of self-affirmation"),
    Challenge(name: "Origami Creation", content: "For this challenge you need to... Fold a simple origami shape, like a paper crane or a flower, take a photo of the finished piece, and reflect on the patience and precision required for origami. Consider how the act of folding paper can symbolise the transformation of something simple into something beautiful."),
    Challenge(name: "Finger Painting", content: "For this challenge you need to... Take a few minutes to finger paint a small, colourful artwork, photograph your creation, and reflect on the tactile and liberating experience of expressing yourself through art. Consider the freedom and creativity that finger painting allows."),
    Challenge(name: "Decision Menu", content: "For this challenge you need to... Visit a restaurant with a diverse menu. Close your eyes, point to a random item on the menu, take a photo of your selection, and reflect on the element of surprise in your meal choice."),
    Challenge(name: "Wheel of Choice", content: "For this challenge you need to... Create a wheel of options on a piece of paper or use an online randomiser tool. Spin the wheel to make a decision. Take a photo of the wheel, and reflect on how randomness influenced your choice."),
    Challenge(name: "Rock-Paper-Scissors", content: "For this challenge you need to... Play a quick round of rock-paper-scissors to decide between two options, photograph the moment of decision, and reflect on the simplicity of the game."),
    Challenge(name: "Decision Playlist", content: "For this challenge you need to... Create two or more playlists based on different moods or themes. Play one at random, take a screenshot of the song that plays, and reflect on how the music influences your decision."),
    //Challenge(name: "Challenge 32", content: "For this challenge you need to...")
    
    ]
}
/* Nature and Self-Reflection:
 Nature Walk
 Morning Coffee/Tea
 Sunset/Sunrise
 Plant Care
 Favourite Book Page
 Write a Haiku
 Mini Meditation
 Family Time
 Inspirational Quote
 Mindfulness Moment
 Dance Break

 Creativity and Art:
 Doodle or Sketch
 Puzzle Progress
 Hobby Time
 Handwritten Note
 Favourite Art Piece
 DIY Craft
 Music Break
 Origami Creation
 Finger Painting
 
 Mindfulness and Mindful Observation:
 Healthy Snack
 Cloud Watching
 Mindful Breathing
 Window View
 Garden Snapshot
 Star Gazing
 Gratitude Journal
 Shadow Play
 
 Decision-Making and Chance:
 Flipping a Coin Decision
 Decision Menu
 Wheel of Choice
 Rock-Paper-Scissors
 Decision Playlist
 Decision Dice*/
