'use strict'

window.addEventListener('load', ()=>
{
    const TECLAS_BLANCAS = ['q','w','e','r','t','y','u','z','x','c','v','b','n','m'];
    const TECLAS_NEGRAS = ['2','3','5','6','7','s','d','g','h','j'];
    const notas = document.querySelectorAll("li");
    const teclasBlancas = document.querySelectorAll(".tecla_blanca");
    const teclasNegras = document.querySelectorAll(".tecla_negra");


    notas.forEach(nota => 
    {
        nota.addEventListener('click', () => tocarNota(nota));
    });

    document.addEventListener('keydown', e =>
    {
        if(e.repeat)
            return;
        const tecla = e.key;
        const teclaBlancaI = TECLAS_BLANCAS.indexOf(tecla);
        const teclaNegraI = TECLAS_NEGRAS.indexOf(tecla);

        if(teclaNegraI > -1)
        {
            teclasNegras[teclaNegraI].classList.add('tecla_negra_active');
        }

        if(teclaBlancaI > -1)
        {
            teclasBlancas[teclaBlancaI].classList.add('tecla_blanca_active');           
        }
        
        if(teclaBlancaI > -1)
            tocarNota(teclasBlancas[teclaBlancaI]);
        if(teclaNegraI > -1)
            tocarNota(teclasNegras[teclaNegraI]);
    });

    document.addEventListener('keyup', e =>
    {
        const tecla = e.key;
        const teclaBlancaI = TECLAS_BLANCAS.indexOf(tecla);
        const teclaNegraI = TECLAS_NEGRAS.indexOf(tecla);
        
        if(teclaNegraI > -1)
        {
            teclasNegras[teclaNegraI].classList.remove('tecla_negra_active');
        }

        if(teclaBlancaI > -1)
        {
            teclasBlancas[teclaBlancaI].classList.remove('tecla_blanca_active');          
        }
    });

    function tocarNota(nota)
    {
        const notaAudio = document.getElementById(nota.dataset.note);
        notaAudio.currentTime = 0;
        
        notaAudio.play();       
    }
});
