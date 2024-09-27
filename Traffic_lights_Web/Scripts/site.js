let crossingAllowed = false;

function changeLight(color) {
    // Get the light elements
    var redLight = document.getElementById('redLight');
    var yellowLight = document.getElementById('yellowLight');
    var greenLight = document.getElementById('greenLight');

    // Turn all lights off initially
    redLight.className = 'light off';
    yellowLight.className = 'light off';
    greenLight.className = 'light off';

    // Turn on the selected light
    if (color === 'red') {
        redLight.className = 'light red';
        stopCar();
        crossingAllowed = false; // Set crossing to not allowed
        // Automatically move pedestrian when red
        movePedestrian();
    } else if (color === 'yellow') {
        yellowLight.className = 'light yellow';
        crossingAllowed = false; // Set crossing to not allowed
    } else if (color === 'green') {
        greenLight.className = 'light green';
        moveCar();
        crossingAllowed = true; // Set crossing to allowed
    }
}

function moveCar() {
    var car = document.getElementById('car');
    car.style.left = '80%'; // Move car to the right
}

function stopCar() {
    var car = document.getElementById('car');
    car.style.left = '10%'; // Reset car position
}

function requestCross() {
    if (!crossingAllowed) { // Check if crossing is allowed
        alert("You cannot cross when the light is red or yellow!");
        return; // Exit the function if crossing is not allowed
    }
    alert("You can cross now!");
    let pedestrian = document.getElementById('pedestrian');
    pedestrian.style.display = 'block'; // Show pedestrian
    pedestrian.style.transition = 'left 3s linear';
    pedestrian.style.left = '50%'; // Move pedestrian to cross
    setTimeout(() => {
        pedestrian.style.left = '10%'; // Reset position after crossing
        pedestrian.style.display = 'none'; // Hide pedestrian after crossing
    }, 3000); // Adjust time to match crossing duration
}

function movePedestrian() {
    let pedestrian = document.getElementById('pedestrian');
    pedestrian.style.display = 'block'; // Show pedestrian
    pedestrian.style.transition = 'left 3s linear';
    pedestrian.style.left = '50%'; // Move pedestrian to cross
    setTimeout(() => {
        pedestrian.style.left = '10%'; // Reset position after crossing
        pedestrian.style.display = 'none'; // Hide pedestrian after crossing
    }, 3000); // Adjust time to match crossing duration
}
