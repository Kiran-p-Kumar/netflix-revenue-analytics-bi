import pandas as pd

# File names as they appear in your sidebar
movie_file = 'netflix_movies_detailed_up_to_2025 (5).csv'
tv_file = 'netflix_tv_shows_detailed_up_to_2025.csv'

# 1. Load the data
movies_df = pd.read_csv(movie_file)
tv_df = pd.read_csv(tv_file)

# 2. Select common columns (important for SQL table structure)
common_cols = [
    'show_id', 'type', 'title', 'director', 'cast', 'country', 
    'date_added', 'release_year', 'rating', 'duration', 'genres', 
    'description', 'popularity', 'vote_average'
]

# 3. Combine both into one Master File
master_df = pd.concat([movies_df[common_cols], tv_df[common_cols]], ignore_index=True)

# 4. Basic Cleaning: Remove newlines from descriptions to avoid CSV errors in MySQL
master_df['description'] = master_df['description'].astype(str).str.replace('\n', ' ').str.replace('\r', ' ')

# 5. Save the result
master_df.to_csv('netflix_master_content.csv', index=False)

print("ETL Complete: Created 'netflix_master_content.csv' in your folder.")