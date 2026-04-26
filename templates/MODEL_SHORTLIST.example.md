# Model Shortlist

This is a starting shortlist for Jetson-A.
Use quantized local artifacts for `llama.cpp` or another local backend.

The idea is to pick one model per class, test it, then stop if the assistant stays responsive.

## Fast small models

| Candidate | Upstream card | Why it belongs here | Local note |
|---|---|---|---|
| Qwen2.5-1.5B-Instruct | https://huggingface.co/Qwen/Qwen2.5-1.5B-Instruct | small baseline for chat, summaries, and educator prompts | use a quantized local artifact |
| Llama 3.2 1B Instruct | https://huggingface.co/meta-llama/Llama-3.2-1B-Instruct | tiny general assistant candidate | use a quantized local artifact |
| Gemma 2 2B IT | https://huggingface.co/google/gemma-2-2b-it | small Google-family alternative | use a quantized local artifact |

## Code models

| Candidate | Upstream card | Why it belongs here | Local note |
|---|---|---|---|
| Qwen2.5-Coder-1.5B-Instruct | https://huggingface.co/Qwen/Qwen2.5-Coder-1.5B-Instruct | light code helper, quick edits, and terse scripting | use a quantized local artifact |
| Qwen2.5-Coder-3B-Instruct | https://huggingface.co/Qwen/Qwen2.5-Coder-3B-Instruct | primary code-assistant candidate | use a quantized local artifact |
| Llama 3.2 3B Instruct | https://huggingface.co/meta-llama/Llama-3.2-3B-Instruct | fallback general model if the code model is not the best fit | use a quantized local artifact |

## Heavier practical models

| Candidate | Upstream card | Why it belongs here | Local note |
|---|---|---|---|
| Qwen2.5-7B-Instruct | https://huggingface.co/Qwen/Qwen2.5-7B-Instruct | upper-end general model candidate for Jetson-A | use a tight quantized local artifact |
| Gemma 2 9B IT | https://huggingface.co/google/gemma-2-9b-it | heavier Google-family candidate | use a quantized local artifact only if memory stays comfortable |

## Recommended first test order

1. Qwen2.5-1.5B-Instruct
2. Qwen2.5-Coder-3B-Instruct
3. Llama 3.2 3B Instruct
4. Qwen2.5-7B-Instruct
5. Gemma 2 9B IT

## Fit rules

- Keep one fast model.
- Keep one code model.
- Add one heavy model only if Jetson-A still feels usable.
- Favor GGUF or another llama.cpp-friendly quantized artifact.
- Record the actual results in `templates/MODEL_TEST_LOG.csv`.
