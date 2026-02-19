<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotstar DevOps · Application</title>
    <!-- Fonts & Icons -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        html, body {
            min-height: 100%;
            background: #FFF; /* Hotstar dark base */
            font-family: 'Roboto', Arial, sans-serif;
        }

        .testbox {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 2rem 1rem;
            min-height: 100vh;
            background: radial-gradient(circle at 20% 30%, #1a1a1a, #000000);
        }

        /* Hotstar red card */
        form {
            width: 100%;
            max-width: 880px;
            background: rgba(25, 25, 25, 0.85);
            backdrop-filter: blur(4px);
            border-radius: 12px;
            padding: 2rem 2.5rem;
            box-shadow: 0 20px 40px rgba(20, 200, 20, 0.25), 0 0 0 2px #b20710 inset;
            border: 1px solid #e50914;
            transition: box-shadow 0.2s ease;
        }

        form:hover {
            box-shadow: 0 25px 50px rgba(20,200, 20, 0.4), 0 0 0 2px #e50914 inset;
        }

        /* banner – Hotstar style */
        .banner {
            position: relative;
            display: flex;
            justify-content: center;
            align-items: center;
            margin-bottom: 2rem;
            padding: 1.5rem 0;
            background: linear-gradient(145deg, #b20710 0%, #e50914 80%);
            border-radius: 8px 8px 24px 24px;
            box-shadow: 0 8px 0 #831010;
        }

        .banner h1 {
            font-size: 2.4rem;
            font-weight: 700;
            letter-spacing: 1px;
            color: #ffffff;
            text-transform: uppercase;
            text-shadow: 4px 4px 0 #6d0000;
            margin: 0;
            padding: 0 20px;
            text-align: center;
            word-break: break-word;
        }

        /* subtle Hotstar "N" watermark */
        .banner::after {
            content: "N";
            font-size: 6rem;
            font-weight: 900;
            color: rgba(0, 0, 0, 0.15);
            position: absolute;
            right: 15px;
            top: 0;
            line-height: 1;
            font-family: 'Roboto', sans-serif;
            pointer-events: none;
        }

        /* texts */
        p, label, span, .question p {
            color: #f5f5f5;
        }

        p.top-info {
            font-size: 1.1rem;
            line-height: 1.5;
            margin: 20px 0 15px 0;
            background: #1f1f1f;
            padding: 15px 20px;
            border-left: 6px solid #e50914;
            border-radius: 0 12px 12px 0;
            font-weight: 400;
            box-shadow: 0 4px 10px rgba(229,9,20,0.2);
        }

        p.top-info b {
            color: #ffffff;
            font-weight: 500;
        }

        .item p, .question p {
            font-weight: 500;
            margin-bottom: 6px;
            font-size: 1rem;
            display: flex;
            align-items: center;
            gap: 5px;
            color: #ddd;
        }

        .required {
            color: #e50914;
            font-size: 1.2rem;
            margin-left: 4px;
        }

        /* form fields – dark & red accents */
        input, select, textarea {
            background: #2b2b2b;
            border: 1px solid #3a3a3a;
            border-radius: 6px;
            color: #fff;
            font-size: 1rem;
            padding: 12px 14px;
            width: 100%;
            transition: border 0.2s, box-shadow 0.2s;
        }

        input:focus, select:focus, textarea:focus {
            border-color: #e50914;
            outline: none;
            box-shadow: 0 0 0 3px rgba(229, 9, 20, 0.3);
        }

        input::placeholder {
            color: #777;
            font-size: 0.95rem;
        }

        /* name item double fields */
        .name-item {
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
        }
        .name-item input {
            flex: 1 1 calc(50% - 20px);
            min-width: 150px;
        }

        /* contact & position row */
        .contact-item, .position-item {
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
            margin-top: 10px;
        }
        .contact-item .item, .position-item .item {
            flex: 1 1 calc(50% - 20px);
            min-width: 200px;
        }

        .item {
            margin: 16px 0;
        }

        /* select arrow style */
        select {
            appearance: none;
            background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="%23e50914" stroke-width="2"><polyline points="6 9 12 15 18 9"/></svg>');
            background-repeat: no-repeat;
            background-position: right 15px center;
            background-size: 16px;
        }

        /* date icon */
        .item {
            position: relative;
        }
        .item i.fa-calendar-alt {
            position: absolute;
            right: 15px;
            bottom: 18px;
            color: #e50914;
            font-size: 1.4rem;
            pointer-events: none;
        }
        input[type="date"]::-webkit-calendar-picker-indicator {
            opacity: 0;
            position: absolute;
            right: 8px;
            width: 30px;
            height: 30px;
            cursor: pointer;
            z-index: 5;
        }

        /* radio buttons - Hotstar style */
        .question-answer {
            display: flex;
            flex-wrap: wrap;
            gap: 30px;
            align-items: center;
            margin: 15px 0 10px;
        }
        .question-answer div {
            display: flex;
            align-items: center;
        }
        input[type=radio] {
            display: none;
        }
        label.radio {
            position: relative;
            padding-left: 32px;
            cursor: pointer;
            font-size: 1rem;
            color: #ccc;
            user-select: none;
        }
        label.radio:before {
            content: "";
            position: absolute;
            left: 0;
            top: -1px;
            width: 20px;
            height: 20px;
            border-radius: 50%;
            border: 2px solid #555;
            background: transparent;
            transition: 0.2s;
        }
        input[type=radio]:checked + label:before {
            border-color: #e50914;
            background: #e50914;
            box-shadow: inset 0 0 0 4px #1e1e1e;
        }
        label.radio:hover:before {
            border-color: #e50914;
        }

        /* file & URL section */
        input[type="file"] {
            padding: 8px;
            background: #1e1e1e;
            border: 1px dashed #e50914;
        }
        input[type="file"]::file-selector-button {
            background: #e50914;
            border: none;
            color: white;
            padding: 8px 18px;
            border-radius: 30px;
            font-weight: 600;
            margin-right: 15px;
            cursor: pointer;
            transition: 0.2s;
        }
        input[type="file"]::file-selector-button:hover {
            background: #b20710;
        }

        /* apply button – Hotstar big red */
        .btn-block {
            margin-top: 30px;
            text-align: center;
        }
        button {
            background: #e50914;
            border: none;
            border-radius: 40px;
            padding: 16px 50px;
            font-size: 1.5rem;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 2px;
            color: #fff;
            box-shadow: 0 10px 0 #831010, 0 5px 20px rgba(229,9,20,0.5);
            cursor: pointer;
            transition: all 0.08s linear;
            border: 1px solid #ff5a5f;
        }
        button:hover {
            background: #f6121d;
            box-shadow: 0 8px 0 #6d0000, 0 8px 25px rgba(229,9,20,0.7);
            transform: translateY(-2px);
        }
        button:active {
            transform: translateY(6px);
            box-shadow: 0 4px 0 #6d0000, 0 8px 20px #e50914;
        }

        /* small bottom message */
        div[align="left"] p {
            color: #aaa;
            font-style: italic;
            margin: 10px 0 0 0;
        }
        div[align="left"] p:first-of-type {
            margin-top: 0;
            font-size: 0.95rem;
        }
        .top-info + div p {
            font-size: 1rem;
            color: #e50914;
            font-weight: 500;
            margin-bottom: 10px;
        }

        /* adjust spacing for Hotstar vibe */
        .banner + div p {
            font-size: 1.15rem;
        }

        hr {
            border: 1px solid #2c2c2c;
            margin: 20px 0;
        }
    </style>
</head>
<body>
    <div class="testbox">
        <form action="/" method="post">
            <div class="banner">
                <h1>Nissitha Corp - HIRING!</h1>
            </div>

            <!-- tagline -->
            <div align="left">
                <p class="top-info"><b>Join the team that delivers entertainment to 260 million members.</b> <br> 
                Fill the application below – we're looking for streaming reliability wizards.</p>
            </div>

            <!-- short feedback message -->
            <div align="left">
                <p><i class="fas fa-bolt" style="color:#e50914;"></i> We'll contact you within 48h.</p>
            </div>

            <!-- name -->
            <div class="item">
                <p>Full name <span class="required">*</span></p>
                <div class="name-item">
                    <input type="text" name="firstname" placeholder="First (e.g., Eleven)" required>
                    <input type="text" name="lastname" placeholder="Last (e.g., Hopper)" required>
                </div>
            </div>

            <!-- contact line : email + phone -->
            <div class="contact-item">
                <div class="item">
                    <p>Email <span class="required">*</span></p>
                    <input type="email" name="email" placeholder="stranger.things@hotstar.com" required>
                </div>
                <div class="item">
                    <p>Phone <span class="required">*</span></p>
                    <input type="tel" name="phone" placeholder="+1 (555) 867-5309" required>
                </div>
            </div>

            <!-- position & start date -->
            <div class="position-item">
                <div class="item">
                    <p>Target role <span class="required">*</span></p>
                    <select name="job_position" required>
                        <option value="" disabled selected>— Select a DevOps stream —</option>
                        <option value="job1">Senior DevOps · CDN reliability</option>
                        <option value="job2">Platform Engineer · container orchestration</option>
                        <option value="job3">Chaos Engineer · resilience testing</option>
                        <option value="job4">Observability Lead · tracing & metrics</option>
                        <option value="job5">Junior DevOps · Hotstar internship</option>
                    </select>
                </div>
                <div class="item">
                    <p>Start date <span class="required">*</span></p>
                    <input type="date" name="start_date" required>
                    <i class="fas fa-calendar-alt"></i>
                </div>
            </div>

            <!-- employment status (radio) -->
            <div class="question">
                <p>Current status <span class="required">*</span></p>
                <div class="question-answer">
                    <div>
                        <input type="radio" id="radio_1" name="employment_status" value="employed" required>
                        <label for="radio_1" class="radio"><span>Employed</span></label>
                    </div>
                    <div>
                        <input type="radio" id="radio_2" name="employment_status" value="self_employed">
                        <label for="radio_2" class="radio"><span>Self-Employed</span></label>
                    </div>
                    <div>
                        <input type="radio" id="radio_3" name="employment_status" value="unemployed">
                        <label for="radio_3" class="radio"><span>Unemployed</span></label>
                    </div>
                    <div>
                        <input type="radio" id="radio_4" name="employment_status" value="student">
                        <label for="radio_4" class="radio"><span>Student</span></label>
                    </div>
                </div>
            </div>

            <!-- resume : URL + file attach (Hotstar style) -->
            <div class="item">
                <p><i class="fas fa-cloud-upload-alt" style="color:#e50914;"></i> Resume (URL or upload)</p>
                <input type="url" name="resume_url" placeholder="https://linkedin.com/in/yourprofile or portfolio link" style="margin-bottom: 12px;">
                <input type="file" name="resume_file" accept=".pdf,.doc,.docx,.txt">
                <p style="font-size: 0.8rem; color: #888; margin-top: 4px;">Accepted: PDF, DOC, TXT (max 10MB)</p>
            </div>

            <!-- references Y/N (Hotstar themed) -->
            <div class="question">
                <p>Include references? (optional, but recommended)</p>
                <div class="question-answer">
                    <div>
                        <input type="radio" id="radio_5" name="include_references" value="yes">
                        <label for="radio_5" class="radio"><span>Yes, I'll attach later</span></label>
                    </div>
                    <div>
                        <input type="radio" id="radio_6" name="include_references" value="no" checked>
                        <label for="radio_6" class="radio"><span>No references</span></label>
                    </div>
                </div>
            </div>

            <!-- submit button -->
            <div class="btn-block">
                <button type="submit">Apply!!</button>
            </div>

            <!-- tiny footer (Hotstar copyright style) -->
            <div style="margin-top: 20px; text-align: right; font-size: 0.7rem; color: #505050;">
                <i class="fas fa-play" style="color:#e50914; font-size: 0.5rem;"></i> Hotstar DevOps · 2025
            </div>
        </form>
    </div>
</body>
</html>
