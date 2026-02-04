//
//  HomeViewModel.swift
//  Movie_CollectionView
//
//  Created by Tejasv Singh on 2/3/26.
//

class HomeViewModel {
    private var movies: [Movie] = []
    
    // MARK: Helper Methods
    
    func loadMovies() {
        let objMovie1 = Movie(name: "The Shashank Redemption", description: "F1 is without a doubt Brad Pitt’s greatest movie so far, showcasing his remarkable talent and versatility as an actor. The film delivers everything a truly great movie should have—from a gripping and well-paced story to complex characters, intense emotional moments, and breathtaking visuals. Every scene is crafted with precision, balancing action, drama, and subtle humor, making it an unforgettable cinematic experience. With its compelling plot, outstanding performances, and seamless direction, F1 stands out as a complete package that not only entertains but also leaves a lasting impression on the audience.", releaseDate: "12/11/2025", posterImage: "film.fill")
        movies.append(objMovie1)
        
        let objMovie2 = Movie(name: "The Dark Knight", description: "F2 stands as Brad Pitt’s greatest movie to date, showcasing his finest performance while offering a perfect balance of action, emotion, and compelling storytelling. The film excels in every aspect, from its gripping plot and strong character development to its breathtaking visuals and memorable soundtrack, making it a complete cinematic experience.", releaseDate: "12/11/2025", posterImage: "star.fill")
        movies.append(objMovie2)
        
        let objMovie3 = Movie(
            name: "Inception",
            description: "F3 is a thrilling addition to Brad Pitt’s filmography, highlighting his ability to tackle complex roles with depth and nuance. The movie features an intricate plot, stunning visual effects, high-octane action sequences, and emotional storytelling that resonates with viewers. With outstanding supporting performances, a gripping soundtrack, masterful editing, and moments of clever humor, F3 creates a cinematic experience that is both entertaining and thought-provoking. It truly sets a new standard for what audiences can expect from a blockbuster.",
            releaseDate: "06/15/2026",
            posterImage: "popcorn.fill"
        )
        movies.append(objMovie3)

        let objMovie4 = Movie(
            name: "Pulp Fiction",
            description: "F4 proves why Brad Pitt is one of the most versatile actors of his generation. The movie combines intense drama, thrilling action, and poignant emotional arcs, all wrapped in visually stunning cinematography. Every character is fully developed, the storyline is engaging and unpredictable, and the soundtrack enhances every scene perfectly. F4 also impresses with its witty dialogue, remarkable stunts, and memorable visual sequences, making it an unforgettable experience for moviegoers.",
            releaseDate: "09/20/2026",
            posterImage: "heart.fill"
        )
        movies.append(objMovie4)
        
        let objMovie5 = Movie(
            name: "Forest Gump",
            description: "F5 is an extraordinary showcase of Brad Pitt’s acting prowess, combining heart-pounding action with deeply moving emotional moments. The film boasts a tightly woven plot, remarkable character arcs, stunning cinematography, and an unforgettable score. Clever twists, intense suspense, and moments of humor make F5 an immersive experience that keeps audiences on the edge of their seats. Every scene is crafted to perfection, creating a film that is as visually striking as it is emotionally resonant.",
            releaseDate: "12/01/2026",
            posterImage: "tv.fill"
        )
        movies.append(objMovie5)

        let objMovie6 = Movie(
            name: "The Matrix",
            description: "F6 stands out as one of Brad Pitt’s most compelling performances yet, blending intricate storytelling with thrilling action sequences and poignant emotional beats. The movie features breathtaking visuals, strong supporting performances, and a perfectly paced narrative that draws viewers into its world. With its gripping plot twists, rich character development, and unforgettable moments, F6 delivers everything a great film should, making it a must-watch cinematic experience.",
            releaseDate: "03/14/2027",
            posterImage: "video.fill"
        )
        movies.append(objMovie6)

        let objMovie7 = Movie(
            name: "Titanic",
            description: "F7 elevates Brad Pitt’s legacy with a perfect balance of drama, suspense, and action. The movie is a masterclass in storytelling, featuring a powerful script, compelling performances, visually stunning sequences, and a moving soundtrack. Each scene is meticulously crafted to maximize tension, emotion, and entertainment, making F7 a film that captivates audiences from start to finish. Its blend of heartfelt moments, thrilling sequences, and cinematic brilliance cements it as one of Pitt’s finest works.",
            releaseDate: "07/08/2027",
            posterImage: "camera.fill"
        )
        movies.append(objMovie7)

        let objMovie8 = Movie(
            name: "Avatar",
            description: "F8 is a spectacular addition to Brad Pitt’s filmography, combining intense action, emotional depth, and unforgettable performances. The film delivers a gripping storyline, rich character development, breathtaking visuals, and a powerful score that enhances every moment. Clever humor, suspenseful twists, and stunning cinematography make F8 a complete cinematic experience that leaves a lasting impact on audiences. This movie proves why Brad Pitt continues to be one of the most celebrated actors of his generation.",
            releaseDate: "11/22/2027",
            posterImage: "ticket.fill"
        )
        movies.append(objMovie8)

    }
    
    func numberOfMovies() -> Int {
        return movies.count
    }
    
    func movie(at index: Int) -> Movie {
        return movies[index]
    }
}
