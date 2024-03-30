# Kafka Project : Kazza Movies

!!! note
    [Link to the GitHub](https://github.com/Noobzik/Kafka_KazaaMovies)

!!! abstract "Technical stack used"
    *  Scala
    *  Apache Kafka
    *  [Conduktor.io](https://www.conduktor.io/)

## Synopsis

You joined KazaaMovies, a company specializing in movie streaming for individuals.
After several years of development, they have just added a social dimension to their streaming offer to their streaming offering, which will provide you with information about user interactions and users and their views, but they have only implemented the first technical part: data retrieval.

!!! note "The goal"
    *  To make this data usable, which arrives in several Kafka topics.
    *  All kafka topic will be exposed as a REST API in JSON.

### Lists of Store Name

!!! note "Number of view for each movies, grouped by type of view:"
    *  Stopped at the start of the movie (< 10% of watched movie)
        *  Since launch
        *  At the last minute
        *  At the last five minutes
    *  Stopped in the middle (< 90% of watched movie)
        *  Since launch
        *  At the last minute
        *  At the last five minutes
    *  Ended watching (< 90% of watched movie)
        *  Since launch
        *  At the last minute
        *  At the last five minutes

!!! note "Top 10"
    *  Of movies having best feedback (Score > 5)
    *  Of movies having bad feedback (Score < 2)

### API Routes

!!! note "GET /movies/:id"
    Get the number of view and their stats with a given movie ID

    ```json
    {
        "_id": 1,
        "title": "Movie title",
        "view_count": 200,
        "stats": {
            "past": {
                "start_only": 100,
                "half": 10,
                "full": 90
            },
            "last_minute": {
                "start_only": 80,
                "half": 2,
                "full": 0
            },
            "last_five_minutes": {
                "start_only": 2000,
                "half": 100,
                "full": 90
            }
        }
    }
    ```

!!! note "GET /stats/ten/best/score"
    Returns all time 10 best scores movie based on average score, sorted by desc
    
    ```json
    [
        {
            "title": "movie title 1",
            "score": 9.98
        },
        {
            "title": "movie title 2",
            "score": 9.7
        },
        {
            "title": "movie title 3",
            "score": 8.1
        }
    ]
    ```

!!! note "GET /stats/ten/best/view"
    Returns all time 10 best views movie based on average view count average, sorted by desc
    
    ```json
    [
        {
            "title": "movie title 1",
            "views": 3500
        },
        {
            "title": "movie title 2",
            "views": 2800
        },
        {
            "title": "movie title 3",
            "views": 2778
        }
    ]
    ```

!!! note "GET /stats/ten/worst/score"
    Returns all time 10 worst scores movie based on average score, sorted by asc
    
    ```json
    [
        {
            "title": "movie title 1",
            "score": 2.1
        },
        {
            "title": "movie title 2",
            "score": 2.21
        },
        {
            "title": "movie title 3",
            "score": 3
        }
    ]
    ```

!!! note "GET /stats/ten/worst/view"
    Returns all time 10 worst views movie based on average view count average, sorted by desc
    
    ```json
    [
        {
            "title": "movie title 1",
            "views": 2
        },
        {
            "title": "movie title 2",
            "views": 5
        },
        {
            "title": "movie title 3",
            "views": 12
        }
    ]
    ```