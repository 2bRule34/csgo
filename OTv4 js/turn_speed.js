UI.AddSliderInt(["Misc.", "SUBTAB_MGR", "Movement", "SHEET_MGR", "General"], "Turn speed (real)", 0, 1000);

function draw() {
    var val = UI.GetValue(["Misc.", "SUBTAB_MGR", "Movement", "SHEET_MGR", "General", "Turn speed (real)"])
    UI.SetValue(["Misc.", "SUBTAB_MGR", "Movement", "SHEET_MGR", "General", "Turn speed"], val);
}

Cheat.RegisterCallback("Draw", "draw");