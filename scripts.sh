# coarse stage
# uses StableDiffusion, requires ~6GB VRAM in training
python launch.py --config configs/magic3d-coarse-sd.yaml --train --gpu 0 system.prompt_processor.prompt="cow"

## REFINEMENT STAGE
#horse
python launch.py --config configs/magic3d-refine-sd.yaml --train --gpu 0 system.prompt_processor.prompt="a horse" system.from_coarse=/auto/data2/canxkoz/gan_project/threestudio/outputs/magic3d-coarse-sd/a_horse@20230517-150339/ckpts/last.ckpt
#cow
python launch.py --config configs/magic3d-refine-sd.yaml --train --gpu 1 system.guide_shape=load/shapes/teddy.obj system.prompt_processor.prompt="cow" system.from_coarse=/auto/data2/canxkoz/gan_project/threestudio/outputs/magic3d-coarse-sd/cow@20230529-175934/ckpts/last.ckpt
#pigs
python launch.py --config configs/magic3d-refine-sd.yaml --train --gpu 2 system.prompt_processor.prompt="pigs" system.from_coarse=/auto/data2/canxkoz/gan_project/threestudio/outputs/magic3d-coarse-sd/pigs@20230517-150536/ckpts/last.ckpt


# train Sketch-Shape in Stable Diffusion latent space
python launch.py --config configs/sketchshape.yaml --train --gpu 0 system.guide_shape=example_mesh_0.obj system.prompt_processor.prompt="cow"