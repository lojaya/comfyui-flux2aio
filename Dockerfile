# download models into comfyui



# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.8.4-base

# build-time tokens for gated downloads — never baked into final image.
# pass via: docker build --build-arg HF_TOKEN=$HF_TOKEN ...
ARG HF_TOKEN=""

# install custom nodes into comfyui
RUN comfy node install --exit-on-fail sd-perturbed-attention@1.2.19 --mode remote
RUN git clone https://github.com/kijai/ComfyUI-KJNodes /comfyui/custom_nodes/ComfyUI-KJNodes && cd /comfyui/custom_nodes/ComfyUI-KJNodes && git checkout 068d4fee62d379723dd96dd3e768ed807f7d7135
RUN comfy node install --exit-on-fail comfyui-florence2@1.0.9
RUN comfy node install --exit-on-fail comfyui_controlnet_aux@1.1.3
# RUN comfy node install --exit-on-fail ComfyUI-GGUF@1.1.10
RUN git clone https://github.com/city96/ComfyUI-GGUF /comfyui/custom_nodes/ComfyUI-GGUF && cd /comfyui/custom_nodes/ComfyUI-GGUF && pip install -r requirements.txt
RUN comfy node install --exit-on-fail rgthree-comfy
RUN git clone https://github.com/quasiblob/ComfyUI-EsesImageCompare /comfyui/custom_nodes/ComfyUI-EsesImageCompare

# RUN for i in 1 2 3 4 5; do HF_TOKEN=$HF_TOKEN comfy model download --url 'https://huggingface.co/black-forest-labs/FLUX.2-klein-9b-fp8/resolve/main/flux-2-klein-9b-fp8.safetensors' --relative-path models/text_encoders --filename 'qwen_3_8b.safetensors' && break; if [ $i -eq 5 ]; then echo "model-download failed after 5 attempts" >&2; exit 1; fi; echo "model-download attempt $i failed; retrying in $((i*10))s" >&2; sleep $((i*10)); done
# download models into comfyui
RUN for i in 1 2 3 4 5; do HF_TOKEN=$HF_TOKEN comfy model download --url 'https://huggingface.co/depth-anything/Depth-Anything-V2-Large/resolve/cbbb86a30ce19b5684b7a05155dc7e6cbc7685b9/depth_anything_v2_vitl.pth' --relative-path models/annotators --filename 'depth_anything_v2_vitl.pth' && break; if [ $i -eq 5 ]; then echo "model-download failed after 5 attempts" >&2; exit 1; fi; echo "model-download attempt $i failed; retrying in $((i*10))s" >&2; sleep $((i*10)); done
RUN for i in 1 2 3 4 5; do HF_TOKEN=$HF_TOKEN comfy model download --url 'https://huggingface.co/Comfy-Org/vae-text-encorder-for-flux-klein-9b/resolve/main/split_files/text_encoders/qwen_3_8b.safetensors' --relative-path models/text_encoders --filename 'qwen_3_8b.safetensors' && break; if [ $i -eq 5 ]; then echo "model-download failed after 5 attempts" >&2; exit 1; fi; echo "model-download attempt $i failed; retrying in $((i*10))s" >&2; sleep $((i*10)); done
RUN for i in 1 2 3 4 5; do HF_TOKEN=$HF_TOKEN comfy model download --url 'https://huggingface.co/unsloth/FLUX.2-klein-9B-GGUF/resolve/main/flux-2-klein-9b-Q8_0.gguf' --relative-path models/diffusion_models --filename 'flux-2-klein-9b-Q8_0.gguf' && break; if [ $i -eq 5 ]; then echo "model-download failed after 5 attempts" >&2; exit 1; fi; echo "model-download attempt $i failed; retrying in $((i*10))s" >&2; sleep $((i*10)); done
RUN for i in 1 2 3 4 5; do HF_TOKEN=$HF_TOKEN comfy model download --url 'https://huggingface.co/black-forest-labs/FLUX.2-klein-9B/resolve/main/flux-2-klein-9b.safetensors' --relative-path models/diffusion_models --filename 'flux-2-klein-9b.safetensors' && break; if [ $i -eq 5 ]; then echo "model-download failed after 5 attempts" >&2; exit 1; fi; echo "model-download attempt $i failed; retrying in $((i*10))s" >&2; sleep $((i*10)); done
RUN for i in 1 2 3 4 5; do HF_TOKEN=$HF_TOKEN comfy model download --url 'https://huggingface.co/uwg/upscaler/resolve/main/ESRGAN/4x-UltraSharp.pth' --relative-path models/upscale_models --filename '4x-UltraSharpV2.pth' && break; if [ $i -eq 5 ]; then echo "model-download failed after 5 attempts" >&2; exit 1; fi; echo "model-download attempt $i failed; retrying in $((i*10))s" >&2; sleep $((i*10)); done
RUN for i in 1 2 3 4 5; do HF_TOKEN=$HF_TOKEN comfy model download --url 'https://huggingface.co/verandaj/turn/resolve/main/klein-9b-turn2real_v1.5_ep9.safetensors' --relative-path models/loras --filename 'V2_flux_klein_4.safetensors' && break; if [ $i -eq 5 ]; then echo "model-download failed after 5 attempts" >&2; exit 1; fi; echo "model-download attempt $i failed; retrying in $((i*10))s" >&2; sleep $((i*10)); done
RUN for i in 1 2 3 4 5; do HF_TOKEN=$HF_TOKEN comfy model download --url 'https://huggingface.co/reverentelusarca/detail-enhancer-flux-klein-9b/resolve/main/klein_9b_enhancer_v2.safetensors' --relative-path models/loras --filename 'klein_9b_enhancer_v2.safetensors' && break; if [ $i -eq 5 ]; then echo "model-download failed after 5 attempts" >&2; exit 1; fi; echo "model-download attempt $i failed; retrying in $((i*10))s" >&2; sleep $((i*10)); done
RUN for i in 1 2 3 4 5; do HF_TOKEN=$HF_TOKEN comfy model download --url 'https://huggingface.co/Comfy-Org/flux2-dev/resolve/main/split_files/vae/flux2-vae.safetensors' --relative-path models/vae --filename 'flux2-vae.safetensors' && break; if [ $i -eq 5 ]; then echo "model-download failed after 5 attempts" >&2; exit 1; fi; echo "model-download attempt $i failed; retrying in $((i*10))s" >&2; sleep $((i*10)); done

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/

# user-provided inputs override the auto-generated placeholders above.
# RUN wget --progress=dot:giga -O '/comfyui/input/image_2026-04-12_000315328.png' "https://cool-anteater-319.convex.cloud/api/storage/73c78d32-88ce-4e82-afce-974451514aeb"
# RUN wget --progress=dot:giga -O '/comfyui/input/image_2026-04-12_000317328.png' "https://cool-anteater-319.convex.cloud/api/storage/90232eb2-d76c-4521-a1b1-19835e0dcf52"
# RUN wget --progress=dot:giga -O '/comfyui/input/image_2026-04-12_000914008.png' "https://cool-anteater-319.convex.cloud/api/storage/c1a2cd55-0ba6-4c6c-9164-13c3ea899e2c"
# RUN wget --progress=dot:giga -O '/comfyui/input/image_2026-04-12_000915880.png' "https://cool-anteater-319.convex.cloud/api/storage/2eb796d6-8641-4968-a0da-05fac1223005"
# RUN wget --progress=dot:giga -O '/comfyui/input/image_2026-04-12_232545749.png' "https://cool-anteater-319.convex.cloud/api/storage/0a9aaec2-6e77-4c30-a9c0-757a6e1bcee4"
# RUN wget --progress=dot:giga -O '/comfyui/input/image_2026-04-12_232547862.png' "https://cool-anteater-319.convex.cloud/api/storage/f6854895-97c3-47a4-a4c2-7d338b213bce"
# RUN wget --progress=dot:giga -O '/comfyui/input/image_2026-04-14_191225293.png' "https://cool-anteater-319.convex.cloud/api/storage/c720e03f-d8a7-4bbf-929d-f408768fea0e"
# RUN wget --progress=dot:giga -O '/comfyui/input/image_2026-04-14_191229261.png' "https://cool-anteater-319.convex.cloud/api/storage/da509f00-f422-4a3f-8f4b-31b300861b1d"
# RUN wget --progress=dot:giga -O '/comfyui/input/image_2026-04-14_191232405.png' "https://cool-anteater-319.convex.cloud/api/storage/b8b3b933-dc88-497c-882f-b91b8dca6e19"
# RUN wget --progress=dot:giga -O '/comfyui/input/F2K_refined_00091_.png' "https://cool-anteater-319.convex.cloud/api/storage/515e1a73-d9c1-40f0-a1e5-41d90ca97a10"
