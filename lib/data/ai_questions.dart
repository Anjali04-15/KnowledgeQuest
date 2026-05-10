import '../models/question.dart';
import '../models/topic.dart';
import '../models/domain.dart';

// ─── AI DOMAIN ───────────────────────────────────────────────────────────────

final Domain aiDomain = Domain(
  id: 'ai',
  type: DomainType.ai,
  name: 'Artificial Intelligence',
  description: 'Explore ML, Neural Networks, NLP and more',
  icon: '🤖',
  topics: [
    // Topic 1: Machine Learning Basics
    Topic(
      id: 'ai_ml_basics',
      name: 'ML Basics',
      icon: '📊',
      levels: [
        Level(
          id: 'ai_ml_basics_easy',
          levelNumber: 1,
          difficulty: Difficulty.easy,
          questions: [
            const Question(id: 'q1', text: 'What does ML stand for?', options: ['Machine Learning', 'Meta Language', 'Model Logic', 'Multi Layer'], correctIndex: 0, explanation: 'ML stands for Machine Learning.'),
            const Question(id: 'q2', text: 'Which of these is a supervised learning task?', options: ['Clustering', 'Classification', 'Dimensionality Reduction', 'Association'], correctIndex: 1, explanation: 'Classification is a supervised learning task where labels are provided.'),
            const Question(id: 'q3', text: 'What is a training dataset used for?', options: ['Testing the model', 'Teaching the model', 'Deploying the model', 'Visualizing data'], correctIndex: 1, explanation: 'Training data is used to teach/train the model.'),
            const Question(id: 'q4', text: 'Which algorithm is used for regression?', options: ['K-Means', 'Linear Regression', 'DBSCAN', 'Apriori'], correctIndex: 1, explanation: 'Linear Regression predicts continuous values.'),
            const Question(id: 'q5', text: 'What is overfitting?', options: ['Model performs well on all data', 'Model memorizes training data but fails on new data', 'Model is too simple', 'Model has no parameters'], correctIndex: 1, explanation: 'Overfitting means the model memorizes training data and generalizes poorly.'),
          ],
        ),
        Level(
          id: 'ai_ml_basics_medium',
          levelNumber: 2,
          difficulty: Difficulty.medium,
          questions: [
            const Question(id: 'q6', text: 'What is the bias-variance tradeoff?', options: ['Balancing model complexity vs generalization', 'Choosing between CPU and GPU', 'Selecting learning rate', 'Picking dataset size'], correctIndex: 0, explanation: 'Bias-variance tradeoff balances underfitting (high bias) vs overfitting (high variance).'),
            const Question(id: 'q7', text: 'Which metric is best for imbalanced classification?', options: ['Accuracy', 'F1-Score', 'Mean Squared Error', 'R-Squared'], correctIndex: 1, explanation: 'F1-Score balances precision and recall, better for imbalanced datasets.'),
            const Question(id: 'q8', text: 'What does cross-validation help with?', options: ['Faster training', 'Better generalization estimate', 'Reducing dataset size', 'Increasing model complexity'], correctIndex: 1, explanation: 'Cross-validation gives a more reliable estimate of model performance.'),
            const Question(id: 'q9', text: 'What is regularization in ML?', options: ['Normalizing input data', 'Penalizing model complexity to prevent overfitting', 'Increasing training epochs', 'Removing outliers'], correctIndex: 1, explanation: 'Regularization adds a penalty term to reduce overfitting.'),
            const Question(id: 'q10', text: 'Which of these is an ensemble method?', options: ['Linear Regression', 'Random Forest', 'K-Means', 'PCA'], correctIndex: 1, explanation: 'Random Forest combines multiple decision trees — an ensemble method.'),
          ],
        ),
        Level(
          id: 'ai_ml_basics_hard',
          levelNumber: 3,
          difficulty: Difficulty.hard,
          questions: [
            const Question(id: 'q11', text: 'What is the VC dimension?', options: ['A GPU metric', 'Measure of model capacity/complexity', 'Validation curve dimension', 'Vector computation index'], correctIndex: 1, explanation: 'VC dimension measures the capacity of a hypothesis class.'),
            const Question(id: 'q12', text: 'In gradient boosting, each tree corrects:', options: ['The entire dataset', 'Residual errors of previous trees', 'Random subsets', 'Only outliers'], correctIndex: 1, explanation: 'Gradient boosting fits each new tree to the residuals of the previous ensemble.'),
            const Question(id: 'q13', text: 'What does the kernel trick do in SVM?', options: ['Speeds up computation', 'Maps data to higher dimensions implicitly', 'Reduces features', 'Normalizes data'], correctIndex: 1, explanation: 'The kernel trick computes dot products in high-dimensional space without explicit mapping.'),
            const Question(id: 'q14', text: 'What is the purpose of the learning rate in gradient descent?', options: ['Controls model depth', 'Controls step size during optimization', 'Sets number of epochs', 'Defines batch size'], correctIndex: 1, explanation: 'Learning rate determines how large each optimization step is.'),
            const Question(id: 'q15', text: 'Which loss function is used for binary classification?', options: ['MSE', 'Binary Cross-Entropy', 'Hinge Loss only', 'MAE'], correctIndex: 1, explanation: 'Binary Cross-Entropy (log loss) is standard for binary classification.'),
          ],
        ),
      ],
    ),

    // Topic 2: Neural Networks
    Topic(
      id: 'ai_neural_nets',
      name: 'Neural Networks',
      icon: '🧠',
      levels: [
        Level(
          id: 'ai_neural_nets_easy',
          levelNumber: 1,
          difficulty: Difficulty.easy,
          questions: [
            const Question(id: 'q16', text: 'What is a neuron in a neural network?', options: ['A database entry', 'A basic computational unit', 'A type of layer', 'A loss function'], correctIndex: 1, explanation: 'A neuron is the basic unit that receives inputs, applies weights, and outputs a value.'),
            const Question(id: 'q17', text: 'What is an activation function?', options: ['A training algorithm', 'A function that introduces non-linearity', 'A data preprocessing step', 'A type of optimizer'], correctIndex: 1, explanation: 'Activation functions introduce non-linearity, enabling networks to learn complex patterns.'),
            const Question(id: 'q18', text: 'Which activation function outputs values between 0 and 1?', options: ['ReLU', 'Sigmoid', 'Tanh', 'Leaky ReLU'], correctIndex: 1, explanation: 'Sigmoid outputs values in (0,1), useful for binary outputs.'),
            const Question(id: 'q19', text: 'What is the input layer in a neural network?', options: ['The layer that produces output', 'The layer that receives raw features', 'A hidden layer', 'The loss layer'], correctIndex: 1, explanation: 'The input layer receives the raw feature data.'),
            const Question(id: 'q20', text: 'What does "deep" in deep learning refer to?', options: ['Large datasets', 'Many hidden layers', 'High accuracy', 'Complex math'], correctIndex: 1, explanation: 'Deep learning uses networks with many hidden layers.'),
          ],
        ),
        Level(
          id: 'ai_neural_nets_medium',
          levelNumber: 2,
          difficulty: Difficulty.medium,
          questions: [
            const Question(id: 'q21', text: 'What is backpropagation?', options: ['Forward pass through network', 'Algorithm to compute gradients by chain rule', 'A type of optimizer', 'Data augmentation technique'], correctIndex: 1, explanation: 'Backpropagation computes gradients using the chain rule to update weights.'),
            const Question(id: 'q22', text: 'What does dropout do during training?', options: ['Removes entire layers', 'Randomly deactivates neurons to prevent overfitting', 'Increases learning rate', 'Normalizes weights'], correctIndex: 1, explanation: 'Dropout randomly zeros out neurons during training as a regularization technique.'),
            const Question(id: 'q23', text: 'What is batch normalization?', options: ['Splitting data into batches', 'Normalizing layer inputs to stabilize training', 'A type of activation', 'Gradient clipping'], correctIndex: 1, explanation: 'Batch normalization normalizes activations within a mini-batch to speed up training.'),
            const Question(id: 'q24', text: 'Which optimizer uses adaptive learning rates per parameter?', options: ['SGD', 'Adam', 'Perceptron', 'Newton'], correctIndex: 1, explanation: 'Adam optimizer maintains adaptive learning rates for each parameter.'),
            const Question(id: 'q25', text: 'What is the vanishing gradient problem?', options: ['Gradients become too large', 'Gradients shrink to near zero in deep networks', 'Loss function diverges', 'Weights become negative'], correctIndex: 1, explanation: 'In deep networks, gradients can shrink exponentially, making early layers learn very slowly.'),
          ],
        ),
        Level(
          id: 'ai_neural_nets_hard',
          levelNumber: 3,
          difficulty: Difficulty.hard,
          questions: [
            const Question(id: 'q26', text: 'What is the purpose of skip connections in ResNet?', options: ['Reduce parameters', 'Allow gradients to flow directly, solving vanishing gradients', 'Increase depth', 'Apply attention'], correctIndex: 1, explanation: 'Skip connections let gradients bypass layers, enabling very deep networks to train.'),
            const Question(id: 'q27', text: 'What is weight initialization and why does it matter?', options: ['Setting final weights', 'Setting initial weights to avoid symmetry breaking issues', 'Normalizing weights after training', 'Pruning weights'], correctIndex: 1, explanation: 'Proper initialization (e.g., Xavier, He) prevents vanishing/exploding gradients at the start.'),
            const Question(id: 'q28', text: 'What is the difference between CNN and RNN?', options: ['CNN is for text, RNN for images', 'CNN processes spatial data, RNN processes sequential data', 'They are identical', 'CNN uses attention, RNN does not'], correctIndex: 1, explanation: 'CNNs use convolutions for spatial patterns; RNNs maintain hidden state for sequences.'),
            const Question(id: 'q29', text: 'What problem does LSTM solve compared to vanilla RNN?', options: ['Overfitting', 'Long-term dependency / vanishing gradient in sequences', 'Slow inference', 'High memory usage'], correctIndex: 1, explanation: 'LSTM uses gates to retain long-term dependencies that vanilla RNNs forget.'),
            const Question(id: 'q30', text: 'What is the attention mechanism in transformers?', options: ['A regularization method', 'Weighting input tokens by relevance to each other', 'A type of pooling', 'Gradient scaling'], correctIndex: 1, explanation: 'Attention computes weighted relationships between all tokens simultaneously.'),
          ],
        ),
      ],
    ),

    // Topic 3: NLP
    Topic(
      id: 'ai_nlp',
      name: 'NLP',
      icon: '💬',
      levels: [
        Level(
          id: 'ai_nlp_easy',
          levelNumber: 1,
          difficulty: Difficulty.easy,
          questions: [
            const Question(id: 'q31', text: 'What does NLP stand for?', options: ['Natural Language Processing', 'Neural Logic Programming', 'Network Layer Protocol', 'Numeric Learning Process'], correctIndex: 0, explanation: 'NLP = Natural Language Processing.'),
            const Question(id: 'q32', text: 'What is tokenization in NLP?', options: ['Encrypting text', 'Splitting text into words or subwords', 'Translating text', 'Summarizing text'], correctIndex: 1, explanation: 'Tokenization splits text into tokens (words, subwords, or characters).'),
            const Question(id: 'q33', text: 'What is a stop word?', options: ['A rare word', 'A common word filtered out (e.g., "the", "is")', 'A technical term', 'A misspelled word'], correctIndex: 1, explanation: 'Stop words are common words often removed before NLP processing.'),
            const Question(id: 'q34', text: 'What is sentiment analysis?', options: ['Translating languages', 'Determining positive/negative/neutral tone of text', 'Summarizing documents', 'Extracting keywords'], correctIndex: 1, explanation: 'Sentiment analysis classifies the emotional tone of text.'),
            const Question(id: 'q35', text: 'What is a word embedding?', options: ['Encrypting words', 'Representing words as dense numerical vectors', 'Counting word frequency', 'Removing punctuation'], correctIndex: 1, explanation: 'Word embeddings map words to vectors capturing semantic meaning.'),
          ],
        ),
        Level(
          id: 'ai_nlp_medium',
          levelNumber: 2,
          difficulty: Difficulty.medium,
          questions: [
            const Question(id: 'q36', text: 'What is TF-IDF?', options: ['A neural network', 'Term Frequency-Inverse Document Frequency — a text weighting scheme', 'A tokenizer', 'A translation model'], correctIndex: 1, explanation: 'TF-IDF weights words by how frequent they are in a doc vs. across all docs.'),
            const Question(id: 'q37', text: 'What model introduced the concept of word2vec?', options: ['BERT', 'Mikolov et al. (Google, 2013)', 'GPT', 'ELMo'], correctIndex: 1, explanation: 'Word2Vec was introduced by Mikolov et al. at Google in 2013.'),
            const Question(id: 'q38', text: 'What is named entity recognition (NER)?', options: ['Classifying sentences', 'Identifying entities like names, places, dates in text', 'Translating text', 'Generating text'], correctIndex: 1, explanation: 'NER identifies and classifies named entities in text.'),
            const Question(id: 'q39', text: 'What does BERT stand for?', options: ['Bidirectional Encoder Representations from Transformers', 'Basic Encoding and Retrieval Technique', 'Binary Embedding Recurrent Transformer', 'Batch Encoding with Residual Training'], correctIndex: 0, explanation: 'BERT = Bidirectional Encoder Representations from Transformers.'),
            const Question(id: 'q40', text: 'What is the main advantage of transformer models over RNNs for NLP?', options: ['Fewer parameters', 'Parallel processing of sequences via self-attention', 'Simpler architecture', 'No need for training data'], correctIndex: 1, explanation: 'Transformers process all tokens in parallel, unlike sequential RNNs.'),
          ],
        ),
        Level(
          id: 'ai_nlp_hard',
          levelNumber: 3,
          difficulty: Difficulty.hard,
          questions: [
            const Question(id: 'q41', text: 'What is the difference between GPT and BERT architectures?', options: ['GPT is encoder-only, BERT is decoder-only', 'GPT is decoder-only (generative), BERT is encoder-only (understanding)', 'They are identical', 'GPT uses RNN, BERT uses CNN'], correctIndex: 1, explanation: 'GPT uses a causal decoder for generation; BERT uses a bidirectional encoder for understanding.'),
            const Question(id: 'q42', text: 'What is perplexity in language models?', options: ['Model accuracy', 'Measure of how well a model predicts a sample (lower = better)', 'Training loss', 'Number of parameters'], correctIndex: 1, explanation: 'Perplexity measures prediction uncertainty — lower perplexity means better language model.'),
            const Question(id: 'q43', text: 'What is fine-tuning in the context of LLMs?', options: ['Training from scratch', 'Adapting a pretrained model on a specific task with less data', 'Pruning the model', 'Quantizing weights'], correctIndex: 1, explanation: 'Fine-tuning updates a pretrained model on task-specific data.'),
            const Question(id: 'q44', text: 'What is RAG (Retrieval-Augmented Generation)?', options: ['A training technique', 'Combining retrieval of external documents with LLM generation', 'A tokenization method', 'A type of attention'], correctIndex: 1, explanation: 'RAG retrieves relevant documents and feeds them to an LLM to ground its responses.'),
            const Question(id: 'q45', text: 'What is hallucination in LLMs?', options: ['Model refusing to answer', 'Model generating confident but factually incorrect information', 'Model being too slow', 'Model forgetting context'], correctIndex: 1, explanation: 'Hallucination is when an LLM produces plausible-sounding but incorrect facts.'),
          ],
        ),
      ],
    ),

    // Topic 4: Computer Vision
    Topic(
      id: 'ai_cv',
      name: 'Computer Vision',
      icon: '👁️',
      levels: [
        Level(
          id: 'ai_cv_easy',
          levelNumber: 1,
          difficulty: Difficulty.easy,
          questions: [
            const Question(id: 'q46', text: 'What is computer vision?', options: ['Programming computers to see and interpret images', 'A type of display technology', 'A graphics rendering engine', 'A camera hardware standard'], correctIndex: 0, explanation: 'Computer vision enables machines to interpret and understand visual data.'),
            const Question(id: 'q47', text: 'What does CNN stand for?', options: ['Convolutional Neural Network', 'Cyclic Node Network', 'Central Neural Node', 'Compressed Numeric Network'], correctIndex: 0, explanation: 'CNN = Convolutional Neural Network, the backbone of computer vision.'),
            const Question(id: 'q48', text: 'What is image classification?', options: ['Detecting objects in an image', 'Assigning a label to an entire image', 'Segmenting image regions', 'Generating new images'], correctIndex: 1, explanation: 'Image classification assigns a single category label to an image.'),
            const Question(id: 'q49', text: 'What is a convolution operation?', options: ['Adding pixel values', 'Sliding a filter over an image to extract features', 'Resizing an image', 'Flipping an image'], correctIndex: 1, explanation: 'Convolution slides a kernel over the image to detect local patterns.'),
            const Question(id: 'q50', text: 'What is pooling in CNNs?', options: ['Combining multiple networks', 'Downsampling feature maps to reduce spatial dimensions', 'Adding more filters', 'Normalizing pixel values'], correctIndex: 1, explanation: 'Pooling reduces spatial size while retaining important features.'),
          ],
        ),
        Level(
          id: 'ai_cv_medium',
          levelNumber: 2,
          difficulty: Difficulty.medium,
          questions: [
            const Question(id: 'q51', text: 'What is object detection vs image classification?', options: ['They are the same', 'Detection locates and classifies multiple objects; classification labels the whole image', 'Classification is harder', 'Detection only counts objects'], correctIndex: 1, explanation: 'Object detection finds bounding boxes + labels; classification gives one label per image.'),
            const Question(id: 'q52', text: 'What is transfer learning in CV?', options: ['Moving models between devices', 'Using a pretrained model (e.g., ImageNet) as a starting point', 'Transferring image data', 'Converting model formats'], correctIndex: 1, explanation: 'Transfer learning reuses weights from a model trained on a large dataset.'),
            const Question(id: 'q53', text: 'What is data augmentation in CV?', options: ['Collecting more data', 'Artificially expanding training data via flips, rotations, crops', 'Labeling data', 'Compressing images'], correctIndex: 1, explanation: 'Data augmentation creates variations of training images to improve generalization.'),
            const Question(id: 'q54', text: 'What is semantic segmentation?', options: ['Classifying the whole image', 'Assigning a class label to every pixel', 'Detecting bounding boxes', 'Generating captions'], correctIndex: 1, explanation: 'Semantic segmentation classifies each pixel into a category.'),
            const Question(id: 'q55', text: 'What architecture won ImageNet 2012 and popularized deep learning?', options: ['VGG', 'AlexNet', 'ResNet', 'Inception'], correctIndex: 1, explanation: 'AlexNet won ImageNet 2012 by a large margin, sparking the deep learning revolution.'),
          ],
        ),
        Level(
          id: 'ai_cv_hard',
          levelNumber: 3,
          difficulty: Difficulty.hard,
          questions: [
            const Question(id: 'q56', text: 'What is the role of anchor boxes in object detection?', options: ['Cropping images', 'Predefined bounding box shapes to predict object locations', 'Normalizing images', 'Pooling features'], correctIndex: 1, explanation: 'Anchor boxes are reference boxes of various scales/ratios used to predict object bounds.'),
            const Question(id: 'q57', text: 'What is IoU (Intersection over Union)?', options: ['A loss function', 'Metric measuring overlap between predicted and ground truth boxes', 'A type of pooling', 'An activation function'], correctIndex: 1, explanation: 'IoU = area of overlap / area of union between two bounding boxes.'),
            const Question(id: 'q58', text: 'What is a GAN used for in computer vision?', options: ['Image classification', 'Generating realistic synthetic images', 'Object detection', 'Image compression'], correctIndex: 1, explanation: 'GANs (Generative Adversarial Networks) generate realistic images via generator-discriminator competition.'),
            const Question(id: 'q59', text: 'What is the Vision Transformer (ViT)?', options: ['A CNN variant', 'Applying transformer self-attention directly to image patches', 'A GAN architecture', 'A segmentation model'], correctIndex: 1, explanation: 'ViT splits images into patches and applies transformer attention, rivaling CNNs.'),
            const Question(id: 'q60', text: 'What is non-maximum suppression (NMS)?', options: ['A training technique', 'Removing duplicate overlapping bounding box predictions', 'A normalization method', 'A data augmentation step'], correctIndex: 1, explanation: 'NMS keeps the highest-confidence box and removes overlapping duplicates.'),
          ],
        ),
      ],
    ),

    // Topic 5: AI Ethics & Responsible AI
    Topic(
      id: 'ai_ethics',
      name: 'AI Ethics',
      icon: '⚖️',
      levels: [
        Level(
          id: 'ai_ethics_easy',
          levelNumber: 1,
          difficulty: Difficulty.easy,
          questions: [
            const Question(id: 'q61', text: 'What is AI bias?', options: ['A fast AI model', 'Systematic unfairness in AI outputs due to skewed data or design', 'A type of neural network', 'An optimization technique'], correctIndex: 1, explanation: 'AI bias occurs when models produce unfair outcomes due to biased training data or design.'),
            const Question(id: 'q62', text: 'What is explainability in AI?', options: ['Making AI faster', 'Ability to understand and interpret AI decisions', 'Encrypting AI models', 'Reducing model size'], correctIndex: 1, explanation: 'Explainability means humans can understand why an AI made a specific decision.'),
            const Question(id: 'q63', text: 'What is data privacy in AI?', options: ['Storing data in the cloud', 'Protecting personal information used in AI systems', 'Compressing training data', 'Encrypting model weights'], correctIndex: 1, explanation: 'Data privacy ensures personal data used in AI is handled responsibly.'),
            const Question(id: 'q64', text: 'What does "fairness" mean in AI?', options: ['AI being fast', 'AI treating all groups equitably without discrimination', 'AI being accurate', 'AI being cheap to run'], correctIndex: 1, explanation: 'Fairness in AI means the system does not discriminate against protected groups.'),
            const Question(id: 'q65', text: 'What is the purpose of AI regulation?', options: ['To slow down AI development', 'To ensure AI is safe, fair, and accountable', 'To make AI more expensive', 'To limit AI to governments'], correctIndex: 1, explanation: 'AI regulation aims to ensure responsible development and deployment of AI systems.'),
          ],
        ),
        Level(
          id: 'ai_ethics_medium',
          levelNumber: 2,
          difficulty: Difficulty.medium,
          questions: [
            const Question(id: 'q66', text: 'What is algorithmic accountability?', options: ['Counting algorithm steps', 'Holding developers responsible for AI system outcomes', 'Auditing code performance', 'Measuring algorithm speed'], correctIndex: 1, explanation: 'Algorithmic accountability means developers/organizations are responsible for their AI\'s impacts.'),
            const Question(id: 'q67', text: 'What is differential privacy?', options: ['Different models for different users', 'A technique to add noise to data to protect individual privacy', 'Encrypting model outputs', 'Separating training and test data'], correctIndex: 1, explanation: 'Differential privacy adds calibrated noise so individual records cannot be identified.'),
            const Question(id: 'q68', text: 'What is model transparency?', options: ['Making models run faster', 'Openness about how a model works and makes decisions', 'Publishing model weights', 'Using open-source frameworks'], correctIndex: 1, explanation: 'Transparency means stakeholders can understand the model\'s logic and decision process.'),
            const Question(id: 'q69', text: 'What is the "black box" problem in AI?', options: ['AI running on dark hardware', 'Inability to understand how complex models reach decisions', 'Models that only work offline', 'Encrypted AI systems'], correctIndex: 1, explanation: 'Black box models (like deep networks) make decisions that are hard to interpret.'),
            const Question(id: 'q70', text: 'What is federated learning?', options: ['Training on a central server', 'Training models across devices without sharing raw data', 'A type of ensemble method', 'Distributed data storage'], correctIndex: 1, explanation: 'Federated learning trains models locally on devices, sharing only gradients, not raw data.'),
          ],
        ),
        Level(
          id: 'ai_ethics_hard',
          levelNumber: 3,
          difficulty: Difficulty.hard,
          questions: [
            const Question(id: 'q71', text: 'What is the EU AI Act\'s risk classification?', options: ['Low/Medium/High only', 'Unacceptable/High/Limited/Minimal risk tiers', 'Safe/Unsafe binary', 'No classification system'], correctIndex: 1, explanation: 'The EU AI Act classifies AI into unacceptable, high, limited, and minimal risk categories.'),
            const Question(id: 'q72', text: 'What is adversarial attack in AI?', options: ['Hacking the training server', 'Crafting inputs to deliberately fool an AI model', 'Competing AI companies', 'Noisy training data'], correctIndex: 1, explanation: 'Adversarial attacks add imperceptible perturbations to inputs to cause misclassification.'),
            const Question(id: 'q73', text: 'What is model poisoning?', options: ['Corrupting model weights after deployment', 'Injecting malicious data into training to corrupt the model', 'Overloading inference servers', 'Stealing model outputs'], correctIndex: 1, explanation: 'Model poisoning attacks inject bad training data to manipulate model behavior.'),
            const Question(id: 'q74', text: 'What is the alignment problem in AI?', options: ['Aligning model layers', 'Ensuring AI goals and behavior align with human values', 'Synchronizing distributed training', 'Matching model outputs to labels'], correctIndex: 1, explanation: 'The alignment problem is ensuring advanced AI systems pursue goals beneficial to humans.'),
            const Question(id: 'q75', text: 'What is GDPR\'s relevance to AI?', options: ['It bans all AI in Europe', 'It regulates data processing, giving individuals rights over their data used in AI', 'It mandates open-source AI', 'It only applies to social media'], correctIndex: 1, explanation: 'GDPR gives EU citizens rights over their data, directly impacting how AI systems collect and use personal data.'),
          ],
        ),
      ],
    ),
  ],
);
