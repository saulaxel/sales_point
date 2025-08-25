async function updateExistence(button: HTMLButtonElement): Promise<void> {
    try {
        const id = button.value;
        const response = await fetch(`/api/existence/${id}`, {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/json'
            },
            body: ''
        });

        if (!response.ok) {
            throw new Error(`Server responded with ${response.status}`);
        }

        const data = await response.json();
        console.log('Fetched data:', data);

        const new_existence_id = parseInt(data);

        // Clean the style
        button.classList.remove('btn-success');
        button.classList.remove('btn-warning');
        button.classList.remove('btn-danger');

        // Applying new button style
        if (new_existence_id == 1) {
            button.classList.add('btn-success');
            button.textContent = 'Suficiente'
        } else if (new_existence_id == 2) {
            button.classList.add('btn-warning');
            button.textContent = 'Escaso';
        } else if (new_existence_id == 3) {
            button.classList.add('btn-danger');
            button.textContent = 'Agotado';
        } else {
            button.textContent = 'Error, unknown existence status';
        }

    } catch (error) {
        console.error('Error fetching data', error)
    }
}

const buttons = document.getElementsByClassName('button-existence');

for (const b of buttons) {
    const button = b as HTMLButtonElement;
    button.addEventListener('click', (event: MouseEvent) => {
        const target = event.target! as HTMLButtonElement
        updateExistence(target);
    });
}
