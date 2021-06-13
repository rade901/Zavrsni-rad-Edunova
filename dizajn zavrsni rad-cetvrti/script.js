let dodaj = document.querySelector('button');
let table = document.querySelector('table');


let imeInput = document.querySelector('#ime');
let prezimeInput = document.querySelector('#prezime');
let kontaktInput = document.querySelector('#kontakt');
let emailInput = document.querySelector('#email');
let adresaInput = document.querySelector('#adresa');
let servisInput = document.querySelector('#servis');



dodaj.addEventListener('click', () => {
    let ime = imeInput.value;
    let prezime = prezimeInput.value;
    let kontakt = kontaktInput.value;
    let email = emailInput.value;
    let adresa = adresaInput.value;
    let servis = servisInput.value;

    let template = `
                <tr>
                    <td>${ime}</td>
                    <td>${prezime}</td>
                    <td>${kontakt}</td>
                    <td>${email}</td>
                    <td>${adresa}</td>
                    <td>${servis}</td>
                </tr>`;

    table.innerHTML += template;
});
