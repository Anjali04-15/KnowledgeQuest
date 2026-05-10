import '../models/question.dart';
import '../models/topic.dart';
import '../models/domain.dart';

final Domain cyberDomain = Domain(
  id: 'cyber',
  type: DomainType.cybersecurity,
  name: 'CyberSecurity',
  description: 'Master threats, cryptography, networks & ethical hacking',
  icon: '🔐',
  topics: [
    // Topic 1: Network Security
    Topic(
      id: 'cyber_network',
      name: 'Network Security',
      icon: '🌐',
      levels: [
        Level(
          id: 'cyber_network_easy',
          levelNumber: 1,
          difficulty: Difficulty.easy,
          questions: [
            const Question(id: 'cn1', text: 'What is a firewall?', options: ['A physical wall in data centers', 'A system that monitors and controls network traffic', 'A type of virus', 'An encryption algorithm'], correctIndex: 1, explanation: 'A firewall filters incoming/outgoing network traffic based on security rules.'),
            const Question(id: 'cn2', text: 'What does VPN stand for?', options: ['Virtual Private Network', 'Verified Public Node', 'Virtual Protocol Network', 'Verified Private Node'], correctIndex: 0, explanation: 'VPN = Virtual Private Network, encrypts your internet connection.'),
            const Question(id: 'cn3', text: 'What is a DDoS attack?', options: ['Data Deletion on Servers', 'Overwhelming a server with traffic to make it unavailable', 'Decrypting data on servers', 'Downloading data secretly'], correctIndex: 1, explanation: 'DDoS (Distributed Denial of Service) floods a target with traffic to disrupt service.'),
            const Question(id: 'cn4', text: 'What is a port in networking?', options: ['A physical connector', 'A logical endpoint for communication identified by a number', 'A type of cable', 'A network switch'], correctIndex: 1, explanation: 'Ports are logical endpoints (0-65535) that identify specific services on a host.'),
            const Question(id: 'cn5', text: 'What protocol does HTTPS use for encryption?', options: ['FTP', 'TLS/SSL', 'HTTP', 'SMTP'], correctIndex: 1, explanation: 'HTTPS uses TLS (Transport Layer Security) to encrypt web traffic.'),
          ],
        ),
        Level(
          id: 'cyber_network_medium',
          levelNumber: 2,
          difficulty: Difficulty.medium,
          questions: [
            const Question(id: 'cn6', text: 'What is a man-in-the-middle (MITM) attack?', options: ['Attacking the server directly', 'Intercepting communication between two parties', 'Brute-forcing passwords', 'Injecting SQL code'], correctIndex: 1, explanation: 'MITM attacks intercept and potentially alter communication between two parties.'),
            const Question(id: 'cn7', text: 'What is network segmentation?', options: ['Splitting bandwidth equally', 'Dividing a network into isolated zones to limit breach spread', 'Compressing network packets', 'Monitoring network traffic'], correctIndex: 1, explanation: 'Network segmentation isolates parts of a network to contain breaches.'),
            const Question(id: 'cn8', text: 'What is an IDS?', options: ['Internet Data Service', 'Intrusion Detection System that monitors for suspicious activity', 'Internal DNS Server', 'IP Distribution System'], correctIndex: 1, explanation: 'An IDS monitors network/system activity and alerts on suspicious behavior.'),
            const Question(id: 'cn9', text: 'What is ARP spoofing?', options: ['Faking DNS records', 'Sending fake ARP messages to link attacker\'s MAC to a legitimate IP', 'Overloading ARP tables', 'Encrypting ARP traffic'], correctIndex: 1, explanation: 'ARP spoofing poisons ARP caches to redirect traffic through the attacker.'),
            const Question(id: 'cn10', text: 'What is the purpose of DMZ in network security?', options: ['A military zone', 'A subnet exposing external services while protecting the internal network', 'A type of VPN', 'A firewall rule set'], correctIndex: 1, explanation: 'A DMZ (Demilitarized Zone) hosts public-facing services isolated from the internal network.'),
          ],
        ),
        Level(
          id: 'cyber_network_hard',
          levelNumber: 3,
          difficulty: Difficulty.hard,
          questions: [
            const Question(id: 'cn11', text: 'What is BGP hijacking?', options: ['Attacking routers physically', 'Maliciously rerouting internet traffic by announcing false BGP routes', 'Overloading BGP tables', 'Encrypting BGP traffic'], correctIndex: 1, explanation: 'BGP hijacking announces false routes to redirect internet traffic through attacker-controlled systems.'),
            const Question(id: 'cn12', text: 'What is a zero-day vulnerability?', options: ['A bug fixed on day zero', 'An unknown vulnerability with no available patch', 'A vulnerability discovered after 0 days', 'A low-severity bug'], correctIndex: 1, explanation: 'Zero-day vulnerabilities are unknown to the vendor, leaving zero days to patch before exploitation.'),
            const Question(id: 'cn13', text: 'What is SSL stripping?', options: ['Removing SSL certificates', 'Downgrading HTTPS connections to HTTP to intercept traffic', 'Stealing SSL keys', 'Disabling TLS on servers'], correctIndex: 1, explanation: 'SSL stripping downgrades secure HTTPS connections to unencrypted HTTP.'),
            const Question(id: 'cn14', text: 'What is a honeypot in cybersecurity?', options: ['A sweet data store', 'A decoy system designed to attract and detect attackers', 'A type of firewall', 'An encrypted database'], correctIndex: 1, explanation: 'A honeypot is a trap system that lures attackers to detect and study their methods.'),
            const Question(id: 'cn15', text: 'What is lateral movement in a cyberattack?', options: ['Moving data sideways in a database', 'Attacker moving through a network after initial compromise to reach targets', 'Horizontal scaling of servers', 'Spreading malware via USB'], correctIndex: 1, explanation: 'Lateral movement is when an attacker pivots through a network after gaining initial access.'),
          ],
        ),
      ],
    ),

    // Topic 2: Cryptography
    Topic(
      id: 'cyber_crypto',
      name: 'Cryptography',
      icon: '🔑',
      levels: [
        Level(
          id: 'cyber_crypto_easy',
          levelNumber: 1,
          difficulty: Difficulty.easy,
          questions: [
            const Question(id: 'cc1', text: 'What is encryption?', options: ['Deleting data', 'Converting data into an unreadable format using a key', 'Compressing data', 'Backing up data'], correctIndex: 1, explanation: 'Encryption transforms plaintext into ciphertext using a key.'),
            const Question(id: 'cc2', text: 'What is the difference between symmetric and asymmetric encryption?', options: ['Symmetric is slower', 'Symmetric uses one key; asymmetric uses a public/private key pair', 'Asymmetric is older', 'They are the same'], correctIndex: 1, explanation: 'Symmetric uses one shared key; asymmetric uses a public key to encrypt and private key to decrypt.'),
            const Question(id: 'cc3', text: 'What is a hash function?', options: ['A type of encryption', 'A one-way function that maps data to a fixed-size digest', 'A key exchange protocol', 'A digital signature'], correctIndex: 1, explanation: 'Hash functions produce a fixed-size digest and are one-way (cannot be reversed).'),
            const Question(id: 'cc4', text: 'What does RSA stand for?', options: ['Random Secure Algorithm', 'Rivest–Shamir–Adleman', 'Robust Security Architecture', 'Recursive Symmetric Algorithm'], correctIndex: 1, explanation: 'RSA is named after its inventors: Rivest, Shamir, and Adleman.'),
            const Question(id: 'cc5', text: 'What is a digital signature?', options: ['A handwritten signature scanned', 'A cryptographic proof of authenticity and integrity', 'A type of certificate', 'An encryption key'], correctIndex: 1, explanation: 'Digital signatures use private keys to prove a message\'s authenticity and integrity.'),
          ],
        ),
        Level(
          id: 'cyber_crypto_medium',
          levelNumber: 2,
          difficulty: Difficulty.medium,
          questions: [
            const Question(id: 'cc6', text: 'What is a PKI (Public Key Infrastructure)?', options: ['A private key storage system', 'A framework for managing digital certificates and public keys', 'A type of firewall', 'A network protocol'], correctIndex: 1, explanation: 'PKI manages the creation, distribution, and revocation of digital certificates.'),
            const Question(id: 'cc7', text: 'What is a rainbow table attack?', options: ['A colorful brute force', 'Using precomputed hash-to-password tables to crack hashes', 'A type of MITM attack', 'Attacking multiple targets simultaneously'], correctIndex: 1, explanation: 'Rainbow tables are precomputed tables of hash values used to reverse hash functions.'),
            const Question(id: 'cc8', text: 'What is salting in password hashing?', options: ['Adding flavor to data', 'Adding random data to passwords before hashing to prevent rainbow table attacks', 'Encrypting the hash', 'Storing passwords in plaintext'], correctIndex: 1, explanation: 'A salt is random data added to a password before hashing, making rainbow tables ineffective.'),
            const Question(id: 'cc9', text: 'What is the Diffie-Hellman key exchange?', options: ['A symmetric encryption algorithm', 'A protocol for two parties to establish a shared secret over an insecure channel', 'A hashing algorithm', 'A digital signature scheme'], correctIndex: 1, explanation: 'Diffie-Hellman allows two parties to derive a shared secret without transmitting it.'),
            const Question(id: 'cc10', text: 'What is AES?', options: ['Advanced Encryption Standard — a symmetric block cipher', 'Asymmetric Encryption System', 'Automated Encryption Service', 'Advanced Error Suppression'], correctIndex: 0, explanation: 'AES (Advanced Encryption Standard) is the most widely used symmetric encryption algorithm.'),
          ],
        ),
        Level(
          id: 'cyber_crypto_hard',
          levelNumber: 3,
          difficulty: Difficulty.hard,
          questions: [
            const Question(id: 'cc11', text: 'What is elliptic curve cryptography (ECC)?', options: ['Encryption using curved hardware', 'Public-key cryptography based on elliptic curves, offering smaller keys', 'A type of hash function', 'A symmetric cipher'], correctIndex: 1, explanation: 'ECC provides equivalent security to RSA with much smaller key sizes.'),
            const Question(id: 'cc12', text: 'What is a timing attack?', options: ['Attacking during peak hours', 'Exploiting variations in execution time to extract cryptographic secrets', 'A DDoS variant', 'Attacking time servers'], correctIndex: 1, explanation: 'Timing attacks measure how long cryptographic operations take to infer secret keys.'),
            const Question(id: 'cc13', text: 'What is perfect forward secrecy (PFS)?', options: ['Encryption that never expires', 'Ensuring past session keys are not compromised if long-term keys are', 'A type of certificate', 'Permanent key storage'], correctIndex: 1, explanation: 'PFS generates ephemeral session keys so compromising long-term keys doesn\'t expose past sessions.'),
            const Question(id: 'cc14', text: 'What is a birthday attack in cryptography?', options: ['Attacking on specific dates', 'Exploiting the birthday paradox to find hash collisions faster', 'A brute force variant', 'An attack on certificate authorities'], correctIndex: 1, explanation: 'Birthday attacks exploit the birthday paradox — finding two inputs with the same hash.'),
            const Question(id: 'cc15', text: 'What is homomorphic encryption?', options: ['Encryption for home use', 'Encryption allowing computation on ciphertext without decrypting', 'A type of symmetric cipher', 'Encrypting homogeneous data'], correctIndex: 1, explanation: 'Homomorphic encryption lets you compute on encrypted data, getting encrypted results.'),
          ],
        ),
      ],
    ),

    // Topic 3: Web Security
    Topic(
      id: 'cyber_web',
      name: 'Web Security',
      icon: '🕸️',
      levels: [
        Level(
          id: 'cyber_web_easy',
          levelNumber: 1,
          difficulty: Difficulty.easy,
          questions: [
            const Question(id: 'cw1', text: 'What is SQL injection?', options: ['Adding SQL to a database', 'Inserting malicious SQL code into input fields to manipulate databases', 'A database optimization', 'A type of SQL query'], correctIndex: 1, explanation: 'SQL injection inserts malicious SQL via user inputs to manipulate or access databases.'),
            const Question(id: 'cw2', text: 'What is XSS (Cross-Site Scripting)?', options: ['Crossing between websites', 'Injecting malicious scripts into web pages viewed by other users', 'A CSS vulnerability', 'Cross-server scripting'], correctIndex: 1, explanation: 'XSS injects malicious scripts into web pages to steal data or hijack sessions.'),
            const Question(id: 'cw3', text: 'What is CSRF?', options: ['Cross-Site Request Forgery — tricking users into making unwanted requests', 'Cross-Server Resource Fetch', 'Cached Server Request Failure', 'Client-Side Request Filter'], correctIndex: 0, explanation: 'CSRF tricks authenticated users into submitting malicious requests unknowingly.'),
            const Question(id: 'cw4', text: 'What is a cookie in web security?', options: ['A sweet treat', 'Small data stored by browsers, can contain session tokens', 'A type of web attack', 'A server-side script'], correctIndex: 1, explanation: 'Cookies store session data in browsers; if stolen, attackers can hijack sessions.'),
            const Question(id: 'cw5', text: 'What does HTTPS protect against compared to HTTP?', options: ['Nothing extra', 'Eavesdropping and tampering of data in transit', 'Server-side attacks', 'Database breaches'], correctIndex: 1, explanation: 'HTTPS encrypts data in transit, preventing eavesdropping and MITM attacks.'),
          ],
        ),
        Level(
          id: 'cyber_web_medium',
          levelNumber: 2,
          difficulty: Difficulty.medium,
          questions: [
            const Question(id: 'cw6', text: 'What is the Same-Origin Policy?', options: ['All websites must look the same', 'Browser security restricting scripts from accessing resources of different origins', 'A server configuration rule', 'A cookie policy'], correctIndex: 1, explanation: 'Same-Origin Policy prevents scripts from one origin accessing data from another.'),
            const Question(id: 'cw7', text: 'What is CORS?', options: ['Cross-Origin Resource Sharing — allows controlled cross-origin requests', 'Cookie Origin Restriction System', 'Client-Origin Request Security', 'Cross-Origin Redirect Service'], correctIndex: 0, explanation: 'CORS is a browser mechanism that allows servers to specify who can access their resources.'),
            const Question(id: 'cw8', text: 'What is clickjacking?', options: ['Stealing mouse clicks', 'Tricking users into clicking hidden elements on a malicious page', 'A type of DDoS', 'Hijacking browser sessions'], correctIndex: 1, explanation: 'Clickjacking overlays invisible elements to trick users into clicking unintended things.'),
            const Question(id: 'cw9', text: 'What is a Content Security Policy (CSP)?', options: ['A privacy policy', 'An HTTP header that restricts sources of content to prevent XSS', 'A type of firewall', 'A cookie setting'], correctIndex: 1, explanation: 'CSP headers tell browsers which content sources are trusted, mitigating XSS.'),
            const Question(id: 'cw10', text: 'What is directory traversal?', options: ['Navigating website menus', 'Accessing files outside the web root using ../ sequences', 'A type of SQL injection', 'Listing directory contents'], correctIndex: 1, explanation: 'Directory traversal uses ../ to escape the web root and access sensitive server files.'),
          ],
        ),
        Level(
          id: 'cyber_web_hard',
          levelNumber: 3,
          difficulty: Difficulty.hard,
          questions: [
            const Question(id: 'cw11', text: 'What is Server-Side Request Forgery (SSRF)?', options: ['Forging server certificates', 'Tricking a server into making requests to internal/external resources', 'A client-side attack', 'Forging HTTP headers'], correctIndex: 1, explanation: 'SSRF makes the server send requests on behalf of the attacker, often reaching internal services.'),
            const Question(id: 'cw12', text: 'What is XML External Entity (XXE) injection?', options: ['Injecting XML into databases', 'Exploiting XML parsers to access files or make server-side requests', 'A type of XSS', 'Injecting external CSS'], correctIndex: 1, explanation: 'XXE exploits XML parsers that process external entity references to read files or trigger SSRF.'),
            const Question(id: 'cw13', text: 'What is insecure deserialization?', options: ['Improper JSON formatting', 'Exploiting deserialization of untrusted data to execute arbitrary code', 'A database vulnerability', 'Insecure API design'], correctIndex: 1, explanation: 'Insecure deserialization can lead to RCE when untrusted serialized objects are processed.'),
            const Question(id: 'cw14', text: 'What is the OWASP Top 10?', options: ['Top 10 fastest websites', 'A list of the 10 most critical web application security risks', 'Top 10 security tools', 'Top 10 programming languages for security'], correctIndex: 1, explanation: 'OWASP Top 10 is the standard awareness document for web application security risks.'),
            const Question(id: 'cw15', text: 'What is HTTP response splitting?', options: ['Splitting HTTP responses for performance', 'Injecting CRLF characters to split HTTP responses and inject headers', 'A load balancing technique', 'Compressing HTTP responses'], correctIndex: 1, explanation: 'HTTP response splitting injects CRLF sequences to add malicious headers or responses.'),
          ],
        ),
      ],
    ),

    // Topic 4: Malware & Threats
    Topic(
      id: 'cyber_malware',
      name: 'Malware & Threats',
      icon: '🦠',
      levels: [
        Level(
          id: 'cyber_malware_easy',
          levelNumber: 1,
          difficulty: Difficulty.easy,
          questions: [
            const Question(id: 'cm1', text: 'What is malware?', options: ['Malicious software designed to harm systems', 'A type of hardware', 'A network protocol', 'A security tool'], correctIndex: 0, explanation: 'Malware is any software intentionally designed to cause damage or unauthorized access.'),
            const Question(id: 'cm2', text: 'What is ransomware?', options: ['Software that speeds up computers', 'Malware that encrypts files and demands payment for decryption', 'A type of antivirus', 'A network scanner'], correctIndex: 1, explanation: 'Ransomware encrypts victim\'s files and demands a ransom for the decryption key.'),
            const Question(id: 'cm3', text: 'What is phishing?', options: ['A fishing game', 'Deceptive emails/sites tricking users into revealing credentials', 'A type of malware', 'A network attack'], correctIndex: 1, explanation: 'Phishing uses deceptive messages to trick users into giving up sensitive information.'),
            const Question(id: 'cm4', text: 'What is a Trojan horse in cybersecurity?', options: ['A Greek myth', 'Malware disguised as legitimate software', 'A type of firewall', 'A network protocol'], correctIndex: 1, explanation: 'A Trojan disguises itself as legitimate software to trick users into installing it.'),
            const Question(id: 'cm5', text: 'What is a computer worm?', options: ['A hardware bug', 'Self-replicating malware that spreads across networks without user action', 'A type of virus that needs a host file', 'A network scanner'], correctIndex: 1, explanation: 'Worms self-replicate and spread across networks without needing to attach to files.'),
          ],
        ),
        Level(
          id: 'cyber_malware_medium',
          levelNumber: 2,
          difficulty: Difficulty.medium,
          questions: [
            const Question(id: 'cm6', text: 'What is a rootkit?', options: ['A gardening tool', 'Malware that hides itself and other malware at the OS/root level', 'A type of ransomware', 'A network scanner'], correctIndex: 1, explanation: 'Rootkits hide malicious activity at the OS level, making detection very difficult.'),
            const Question(id: 'cm7', text: 'What is a botnet?', options: ['A network of robots', 'A network of compromised computers controlled by an attacker', 'A type of firewall', 'A legitimate server cluster'], correctIndex: 1, explanation: 'A botnet is a network of infected machines (bots) controlled remotely for attacks.'),
            const Question(id: 'cm8', text: 'What is spyware?', options: ['Government surveillance software', 'Malware that secretly monitors and collects user data', 'A type of antivirus', 'A network monitoring tool'], correctIndex: 1, explanation: 'Spyware secretly collects user information and sends it to attackers.'),
            const Question(id: 'cm9', text: 'What is a keylogger?', options: ['A keyboard shortcut manager', 'Malware that records keystrokes to steal passwords and data', 'A type of firewall', 'A network packet analyzer'], correctIndex: 1, explanation: 'Keyloggers record every keystroke, capturing passwords and sensitive information.'),
            const Question(id: 'cm10', text: 'What is social engineering in cybersecurity?', options: ['Building social networks', 'Manipulating people psychologically to reveal confidential information', 'A type of malware', 'Network engineering'], correctIndex: 1, explanation: 'Social engineering exploits human psychology rather than technical vulnerabilities.'),
          ],
        ),
        Level(
          id: 'cyber_malware_hard',
          levelNumber: 3,
          difficulty: Difficulty.hard,
          questions: [
            const Question(id: 'cm11', text: 'What is a polymorphic virus?', options: ['A virus affecting multiple species', 'A virus that changes its code signature to evade detection', 'A fast-spreading virus', 'A virus targeting polymers'], correctIndex: 1, explanation: 'Polymorphic viruses mutate their code with each infection to evade signature-based detection.'),
            const Question(id: 'cm12', text: 'What is an APT (Advanced Persistent Threat)?', options: ['A fast malware attack', 'A prolonged, targeted cyberattack by sophisticated actors', 'An antivirus product', 'A type of DDoS'], correctIndex: 1, explanation: 'APTs are long-term targeted attacks, often by nation-states, to steal data or disrupt operations.'),
            const Question(id: 'cm13', text: 'What is fileless malware?', options: ['Malware with no name', 'Malware that operates in memory without writing files to disk', 'A deleted malware', 'Malware in encrypted files'], correctIndex: 1, explanation: 'Fileless malware lives in memory and uses legitimate tools, making it hard to detect.'),
            const Question(id: 'cm14', text: 'What is a supply chain attack?', options: ['Attacking delivery trucks', 'Compromising software/hardware in the supply chain to infect end users', 'A type of DDoS', 'Attacking e-commerce sites'], correctIndex: 1, explanation: 'Supply chain attacks compromise trusted vendors/software to reach many downstream targets.'),
            const Question(id: 'cm15', text: 'What is command and control (C2) in malware?', options: ['A military command system', 'Infrastructure attackers use to communicate with and control compromised systems', 'A type of firewall', 'A network management protocol'], correctIndex: 1, explanation: 'C2 servers allow attackers to send commands to and receive data from compromised machines.'),
          ],
        ),
      ],
    ),

    // Topic 5: Ethical Hacking
    Topic(
      id: 'cyber_ethical',
      name: 'Ethical Hacking',
      icon: '🎯',
      levels: [
        Level(
          id: 'cyber_ethical_easy',
          levelNumber: 1,
          difficulty: Difficulty.easy,
          questions: [
            const Question(id: 'ce1', text: 'What is ethical hacking?', options: ['Hacking for fun', 'Authorized testing of systems to find vulnerabilities before attackers do', 'Illegal hacking with good intentions', 'Hacking open-source software'], correctIndex: 1, explanation: 'Ethical hacking is authorized penetration testing to identify and fix security weaknesses.'),
            const Question(id: 'ce2', text: 'What is a penetration test?', options: ['A medical test', 'A simulated cyberattack to evaluate security', 'A network speed test', 'A software performance test'], correctIndex: 1, explanation: 'A penetration test simulates real attacks to find exploitable vulnerabilities.'),
            const Question(id: 'ce3', text: 'What is reconnaissance in hacking?', options: ['Recovering deleted files', 'Gathering information about a target before attacking', 'Removing malware', 'Reporting vulnerabilities'], correctIndex: 1, explanation: 'Reconnaissance is the information-gathering phase before an attack.'),
            const Question(id: 'ce4', text: 'What is a white-hat hacker?', options: ['A hacker who wears white', 'An ethical hacker with authorization to test systems', 'A beginner hacker', 'A government hacker'], correctIndex: 1, explanation: 'White-hat hackers are ethical security professionals who test systems with permission.'),
            const Question(id: 'ce5', text: 'What tool is commonly used for network scanning?', options: ['Photoshop', 'Nmap', 'Excel', 'Notepad'], correctIndex: 1, explanation: 'Nmap is the most widely used network scanner for discovering hosts and services.'),
          ],
        ),
        Level(
          id: 'cyber_ethical_medium',
          levelNumber: 2,
          difficulty: Difficulty.medium,
          questions: [
            const Question(id: 'ce6', text: 'What is the kill chain in cybersecurity?', options: ['A supply chain attack', 'A model describing stages of a cyberattack from recon to exfiltration', 'A type of malware', 'A firewall rule chain'], correctIndex: 1, explanation: 'The Cyber Kill Chain describes attack stages: recon, weaponize, deliver, exploit, install, C2, exfiltrate.'),
            const Question(id: 'ce7', text: 'What is privilege escalation?', options: ['Getting a promotion', 'Gaining higher access rights than initially granted', 'Escalating a security incident', 'Increasing server privileges'], correctIndex: 1, explanation: 'Privilege escalation exploits vulnerabilities to gain higher-level access (e.g., root/admin).'),
            const Question(id: 'ce8', text: 'What is Metasploit?', options: ['A type of malware', 'A penetration testing framework for developing and executing exploits', 'A network scanner', 'An antivirus tool'], correctIndex: 1, explanation: 'Metasploit is the most widely used penetration testing framework.'),
            const Question(id: 'ce9', text: 'What is a CVE?', options: ['Common Vulnerability Exposure — a public database of known vulnerabilities', 'Certified Vulnerability Expert', 'Cyber Vulnerability Engine', 'Critical Virus Entry'], correctIndex: 0, explanation: 'CVE (Common Vulnerabilities and Exposures) is a public list of known security vulnerabilities.'),
            const Question(id: 'ce10', text: 'What is fuzzing in security testing?', options: ['Making code unclear', 'Sending random/malformed inputs to find crashes and vulnerabilities', 'Obfuscating malware', 'Testing network speed'], correctIndex: 1, explanation: 'Fuzzing sends unexpected inputs to applications to discover bugs and security flaws.'),
          ],
        ),
        Level(
          id: 'cyber_ethical_hard',
          levelNumber: 3,
          difficulty: Difficulty.hard,
          questions: [
            const Question(id: 'ce11', text: 'What is OSINT?', options: ['Open Source Intelligence — gathering info from public sources', 'Operating System Intelligence', 'Online Security Intrusion Test', 'Open Standard Internet Tool'], correctIndex: 0, explanation: 'OSINT collects intelligence from publicly available sources for reconnaissance.'),
            const Question(id: 'ce12', text: 'What is a buffer overflow attack?', options: ['Overloading a network buffer', 'Writing data beyond a buffer\'s boundary to overwrite memory and execute code', 'Filling a database', 'Overloading a server\'s RAM'], correctIndex: 1, explanation: 'Buffer overflows write past allocated memory, potentially overwriting return addresses to execute arbitrary code.'),
            const Question(id: 'ce13', text: 'What is ASLR?', options: ['Address Space Layout Randomization — randomizes memory addresses to prevent exploits', 'Advanced Security Layer Routing', 'Automated System Log Review', 'Application Security Level Rating'], correctIndex: 0, explanation: 'ASLR randomizes memory layout to make it harder for attackers to predict addresses for exploits.'),
            const Question(id: 'ce14', text: 'What is a return-oriented programming (ROP) attack?', options: ['Programming that returns values', 'Chaining existing code snippets (gadgets) to bypass DEP/NX protections', 'A type of SQL injection', 'Returning stolen data'], correctIndex: 1, explanation: 'ROP chains existing code gadgets to execute arbitrary logic without injecting new code, bypassing DEP.'),
            const Question(id: 'ce15', text: 'What is threat modeling?', options: ['Creating 3D threat visualizations', 'Systematically identifying and prioritizing potential threats to a system', 'Modeling attacker behavior', 'A type of penetration test'], correctIndex: 1, explanation: 'Threat modeling identifies assets, threats, vulnerabilities, and mitigations in a structured way.'),
          ],
        ),
      ],
    ),
  ],
);
