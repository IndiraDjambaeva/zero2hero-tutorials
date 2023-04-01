import { useEffect, useState } from "react";

function DependentEffect() {
  const names = ["Pasha", "Pavel", "Gabid", "Laura", "Madi"];

  const [recommendations, setRecommendations] = useState([]);
  const [searchText, setSearchText] = useState("");

  useEffect(() => {
    if (searchText.length === 0){
      setRecommendations(names);

    } else if (searchText.length > 0) {
      const newRecs = names.filter((name) => name.toLowerCase().includes(searchText.toLowerCase()));
      setRecommendations(newRecs);
    }
  }, [searchText]);

  return(
    <div>
      <input 
      type="text" 
      onChange={(e) => setSearchText(e.target.value)}></input>
      <h2>Recommendations:</h2>
      
      <ul>
        {recommendations.map((rec, index) => (
         <li key={index}>{rec}</li>
        ))}
      </ul>
        
    </div>
  );
}

export default DependentEffect;