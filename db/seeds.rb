# frozen_string_literal: true

varietals = ["Cabernet Sauvignon", "Pinot Noir", "Chardonnay", "Pinot Grigio", "No Varietal"]

varietals.each{ |varietal| Varietal.create(name: varietal)}
