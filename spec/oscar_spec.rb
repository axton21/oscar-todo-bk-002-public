require 'spec_helper'

describe "" do

  let(:oscars) { JSON.parse(File.read('spec/fixtures/oscars.json')) }
  let(:broken) { JSON.parse(File.read('spec/fixtures/broken.json')) }
  let(:animated_films) { ["Big Hero 6","Song of the Sea","The Boxtrolls","The Tale of the Princess Kaguya","How to Train Your Dragon 2"] }

  describe "#delete_teenage_mutant_ninja_turtles" do
    it "deletes the string Teenage Mutant Ninja Turtles from the array of best films" do
      result = delete_teenage_mutant_ninja_turtles(broken)
      expect(result["best_picture"]).to_not include("Teenage Mutant Ninja Turtles")
    end
  end

  describe "#add_birdman_to_first_index" do
    it "adds Birdman to the front of the best film array" do
      result = add_birdman_to_first_index(broken)
      expect(result["best_picture"][0]).to eq("Birdman")
    end
  end

  describe "#replace_vampire_academy_with_into_the_woods" do
    it "replaces Vampire Academy with Into the Woods" do
      result = replace_vampire_academy_with_into_the_woods(broken)
      expect(result["best_costumes"][2]).to eq("Into the Woods")
      expect(result["best_costumes"]).to_not include("Vampire Academy")
    end
  end

  describe "#delete_best_movies_ever" do
    it "deletes the key, value pair where the key is ':best_movies_ever'" do
      result = delete_best_movies_ever(broken)
      expect(result["best_costumes"][2]).to eq("Into the Woods")
      expect(result["best_costumes"]).to_not include("Vampire Academy")
    end
  end

  describe "#add_best_animated_film" do
    it "adds the key, value pair where the key is ':best_animated_films' 
        and the value is the array of film titles" do
      result = add_best_animated_film(broken)
      expect { result["add_best_animated_film"] }.to_not raise_error
      expect(result.keys.length).to eq(3)
      animated_films.each { |a| expect(result["add_best_animated_film"]).to include(a)}
    end
  end

end
