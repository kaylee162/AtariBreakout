# GBA Atari Breakout (Mode 3)

A simple Atari Breakout–style game written in C for the Game Boy Advance emulator.  
Move using the D-pad, press **Start** to begin, and break blocks to score points.  
Every 5 points, a new block appears at a random location. Miss the ball and you enter a lose state.

---

## 🎮 Controls

- **D-Pad (Up/Down/Left/Right):** Move paddle  
- **Start:** Begin game / Restart from lose state  

---

## 🕹 Gameplay

- Bounce the ball to destroy blocks.
- Each block increases your score.
- Every 5 points, an additional block spawns randomly on the screen.
- If the ball passes your paddle, the game enters a lose state.

---

## 🛠 Built With

- C
- GBA hardware libraries
- Mode 3 rendering
- Compiled with devkitARM / GBA toolchain
- Tested using a GBA emulator (mGBA)

---

## 🚀 How to Build

If using Docker with the GBA compiler image:

```bash
docker run --rm -it -v "${PWD}:/gba" aaaronic/gba-compiler:1.4
make
```

---

## 🧠 Features
- State machine (Start, Game, Lose)
- Random block spawning
- Score tracking
- Increasing difficulty over time
