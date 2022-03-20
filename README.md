# docker-ScratchGAN
Run ScratchGAN in Docker

# Setup

1. Clone this repository to your computer. `git clone https://github.com/pulipulichen/docker-ScratchGAN.git`
2. Start docker service.
3. Run `docker-compose build`
4. Run `docker-compose run app bash` to enter the console of container.
5. Run `bash scratchgan/train.sh`
6. Wait for training and evaluating.
7. The first training result will disappear in `./checkpoints/scratchgan-2002_sentences.txt`
8. Keep waiting for `scratchgan-4002_sentences.txt` and `scratchgan-6002_sentences.txt`. It takes at least three hours to perform each iteration.

# Result

## scratchgan-2002_sentences.txt

The sentences written by ScratchGAN will become more and more like humans after iteration. 

Following are the sentences from scratchgan-2002_sentences.txt:
- What had everything when on of police has running of to winds testing all when am have
- Those I was women to sick to share move 3 have 
- It ' s more only decent of ( apart much Those to should so   

Following are the sentences from scratchgan-4002_sentences.txt:
- Greg bomb said the principle is still because , done that it is a 
- He took the time on a family property to appropriate in 2010 together something , and the Protection 
- Although it has said that I just like the after old wonderful ending and opened

And then, following are the sentences from scratchgan-4002_sentences.txt:
- Instead that the same time before I would decided to it held , his lives , than badly like it at the  
- And the fans moved the game off open that the middle voting of government , fairly now as those economies country increased at its   
- The second year of ABC Florida 250 seconds about the third Trust , certainly ' t show again to it down that every

But the setences still seem meaningless.

# Chinese issue

I have tried to replace universal-sentence-encoder with universal-sentence-encoder-multilingual in `eval_metrics.py` but failed. It seem like got module version conflicting in tensorflow_gan and tensorflow_text, which is required by universal-sentence-encoder-multilingual. Maybe you can try another sentence representation encoder in the futrue.