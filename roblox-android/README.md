# LM Roblox — teste isolado no GitHub

Este é um protótipo de construção em Rojo para Roblox, preparado para desenvolvimento a partir do Android.

**Roblox Universe ID (informado pelo usuário):** 9982457473
**Place ID inicial (informado pelo usuário):** 86996579822787

## O que contém
- Mapa simples, ruas, quatro prédios e spawn gerados em Luau
- 12 moedas com reaparecimento, leaderstats e HUD
- Compilação automatizada de um arquivo `.rbxlx`, sem autenticação Roblox

## Segurança
- Esta branch NÃO altera a branch `main` do projeto HorizonLM-Lab-.
- O workflow deste experimento não contém nenhum passo de publicação, nenhuma chave de API e nenhum endpoint de envio ao Roblox.
- `rojo build` gera um lugar completo a partir do projeto. Publicá-lo no Place existente substituiria o conteúdo atual. Não faça isso sem backup validado.
- O código é um exemplo separado e **não** é uma cópia do lugar existente.

## Como obter o resultado
Abra a aba Actions no GitHub e procure a execução `Roblox Android - build isolado` acionada pela branch `experiment/roblox-android-starter`. Se a execução for concluída com êxito, baixe o artifact `LM-Roblox-Android-RBXLX`.

Este é um experimento hospedado numa branch de laboratório, não a organização definitiva de um repositório Roblox. Para desenvolvimento contínuo, mova-o para um repositório exclusivo.

Fontes: https://create.roblox.com/docs/projects/rojo e https://create.roblox.com/docs/cloud/guides/usage-place-publishing
