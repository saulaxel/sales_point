"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
function updateExistence(button) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const id = button.value;
            const response = yield fetch(`/api/existence/${id}`, {
                method: 'PUT',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: ''
            });
            if (!response.ok) {
                throw new Error(`Server responded with ${response.status}`);
            }
            const data = yield response.json();
            console.log('Fetched data:', data);
            const new_existence_id = parseInt(data);
            // Clean the style
            button.classList.remove('btn-success');
            button.classList.remove('btn-warning');
            button.classList.remove('btn-danger');
            // Applying new button style
            if (new_existence_id == 1) {
                button.classList.add('btn-success');
                button.textContent = 'Suficiente';
            }
            else if (new_existence_id == 2) {
                button.classList.add('btn-warning');
                button.textContent = 'Escaso';
            }
            else if (new_existence_id == 3) {
                button.classList.add('btn-danger');
                button.textContent = 'Agotado';
            }
            else {
                button.textContent = 'Error, unknown existence status';
            }
        }
        catch (error) {
            console.error('Error fetching data', error);
        }
    });
}
const buttons = document.getElementsByClassName('button-existence');
for (const b of buttons) {
    const button = b;
    button.addEventListener('click', (event) => {
        const target = event.target;
        updateExistence(target);
    });
}
