module ProjectsHelper
  def fill_id(id)
    aux = id.downcase
    if id == "To Do"
      aux.gsub /\s/, "_"
    else 
      aux
    end
  end
end
