//::///////////////////////////////////////////////
//:: Witch's Wale: Subraces Include File
//:: WW_Inc_Subraces
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Assigns the WW subraces and their effects.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: January 15, 2003
//:://////////////////////////////////////////////

void SetupSubraces(object oCreature)
{
    //Get the status of their plot flag and commandability
    int bPlotFlagState = GetPlotFlag(oCreature);
    int bCommandableState = GetCommandable(oCreature);

    //Destroy any existing hide items
    object oHide = GetItemInSlot (INVENTORY_SLOT_CARMOUR, oCreature);
    DestroyObject(oHide);

    //Parse their race and subrace
    int iRace = GetRacialType(oCreature);
    string sSubrace = GetStringLowerCase(GetSubRace(oCreature));
    string sNewHide;
    if (iRace == RACIAL_TYPE_DWARF)
    {
        //Cairn Dwarves
        if (sSubrace == "dwarf: cairn" ||
            sSubrace == "cairn" ||
            sSubrace == "cairn dwarf" ||
            sSubrace == "barrow" ||
            sSubrace == "barrow dwarf")
        {
            //Standardize Subrace
            SetSubRace(oCreature, "Dwarf: Cairn");

            //Declare the new hide.
            sNewHide = "ww_sr_cairn";
        }
        //Lorekeeper Dwarves
        if (sSubrace == "dwarf: lorekeeper" ||
            sSubrace == "dwarf: lore keeper" ||
            sSubrace == "dwarf: lore-keeper" ||
            sSubrace == "lorekeeper" ||
            sSubrace == "lore keeper" ||
            sSubrace == "lore-keeper" ||
            sSubrace == "lorekeeper dwarf" ||
            sSubrace == "lore keeper dwarf" ||
            sSubrace == "lore-keeper dwarf")
        {
            //Standardize Subrace
            SetSubRace(oCreature, "Dwarf: Lorekeeper");

            //Declare the new hide.
            sNewHide = "ww_sr_lore";
        }
    }
    if (iRace == RACIAL_TYPE_ELF)
    {
        //Shadow Elves
        if (sSubrace == "elf: shadow" ||
            sSubrace == "shadow" ||
            sSubrace == "shadow elf" ||
            sSubrace == "dark elf" ||
            sSubrace == "drow" ||
            sSubrace == "drow elf")
        {
            //Standardize Subrace
            SetSubRace(oCreature, "Elf: Shadow");

            //Declare the new hide.
            sNewHide = "ww_sr_shadow";
        }
        //Sylvan Elves
        if (sSubrace == "elf: sylvan" ||
            sSubrace == "sylvan" ||
            sSubrace == "sylvan elf" ||
            sSubrace == "forest" ||
            sSubrace == "forest elf" ||
            sSubrace == "wood" ||
            sSubrace == "wood elf" ||
            sSubrace == "green" ||
            sSubrace == "green elf" ||
            sSubrace == "tree" ||
            sSubrace == "tree elf")
        {
            //Standardize Subrace
            SetSubRace(oCreature, "Elf: Sylvan");

            //Declare the new hide.
            sNewHide = "ww_sr_sylvan";

            //Add the Tracking device if they don't already have it.
            object oTracker = GetItemPossessedBy(oCreature, "WW_Tracker");
            if (oTracker == OBJECT_INVALID)
            {
                CreateItemOnObject("trackertool", oCreature);
            }
        }
        //Elf Nomads
        if (sSubrace == "elf: nomad" ||
            sSubrace == "nomad" ||
            sSubrace == "nomad elf" ||
            sSubrace == "elf nomad" ||
            sSubrace == "undead" ||
            sSubrace == "undead elf")
        {
            //Standardize Subrace
            SetSubRace(oCreature, "Elf: Nomad");

            //Declare the new hide.
            sNewHide = "ww_sr_nomad";
        }
    }
    if (iRace == RACIAL_TYPE_GNOME)
    {
        //Deep Gnomes
        if (sSubrace == "gnome: deep" ||
            sSubrace == "deep" ||
            sSubrace == "deep gnome" ||
            sSubrace == "svirfneblin")
        {
            //Standardize Subrace
            SetSubRace(oCreature, "Gnome: Deep");

            //Declare the new hide.
            sNewHide = "ww_sr_deep";
        }
        //Tinker Gnomes
        if (sSubrace == "gnome: tinker" ||
            sSubrace == "tinker" ||
            sSubrace == "tinker gnome" ||
            sSubrace == "minoi" ||
            sSubrace == "rock" ||
            sSubrace == "rock gnome")
        {
            //Standardize Subrace
            SetSubRace(oCreature, "Gnome: Tinker");

            //Declare the new hide.
            sNewHide = "ww_sr_tinker";
        }
    }
    if (iRace == RACIAL_TYPE_HALFLING)
    {
        //Feral Halflings
        if (sSubrace == "halfling: feral" ||
            sSubrace == "feral" ||
            sSubrace == "feral halfling" ||
            sSubrace == "wild" ||
            sSubrace == "wild halfling")
        {
            //Standardize Subrace
            SetSubRace(oCreature, "Halfling: Feral");

            //Declare the new hide.
            sNewHide = "ww_sr_feral";

            //Add the Tracking device if they don't already have it.
            object oTracker = GetItemPossessedBy(oCreature, "WW_Tracker");
            if (oTracker == OBJECT_INVALID)
            {
                CreateItemOnObject("trackertool", oCreature);
            }
        }
        //Imperial Halflings
        if (sSubrace == "halfling: imperial" ||
            sSubrace == "imperial" ||
            sSubrace == "imperial halfling" ||
            sSubrace == "martial" ||
            sSubrace == "martial halfling")
        {
            //Standardize Subrace
            SetSubRace(oCreature, "Halfling: Imperial");

            //Declare the new hide.
            sNewHide = "ww_sr_imperial";
        }
    }
    if (iRace == RACIAL_TYPE_HALFELF)
    {
        //Air-Touched Half-Elves
        if (sSubrace == "half-elf: air-touched" ||
            sSubrace == "air" ||
            sSubrace == "air-touched" ||
            sSubrace == "air-touched half-elf" ||
            sSubrace == "air-touched halfelf" ||
            sSubrace == "air-touched half elf" ||
            sSubrace == "air touched" ||
            sSubrace == "air touched half-elf" ||
            sSubrace == "air touched halfelf" ||
            sSubrace == "air touched half elf" ||
            sSubrace == "air half-elf" ||
            sSubrace == "air halfelf" ||
            sSubrace == "air half elf")
        {
            //Standardize Subrace
            SetSubRace(oCreature, "Half-Elf: Air-Touched");

            //Declare the new hide.
            sNewHide = "ww_sr_air";
        }
        //Water-Touched Half-Elves
        if (sSubrace == "half-elf: water-touched" ||
            sSubrace == "water" ||
            sSubrace == "water-touched" ||
            sSubrace == "water-touched half-elf" ||
            sSubrace == "water-touched halfelf" ||
            sSubrace == "water-touched half elf" ||
            sSubrace == "water touched" ||
            sSubrace == "water touched half-elf" ||
            sSubrace == "water touched halfelf" ||
            sSubrace == "water touched half elf" ||
            sSubrace == "water half-elf" ||
            sSubrace == "water halfelf" ||
            sSubrace == "water half elf")
        {
            //Standardize Subrace
            SetSubRace(oCreature, "Half-Elf: Water-Touched");

            //Declare the new hide.
            sNewHide = "ww_sr_water";
        }
        //Peregrine Half-Elves
        if (sSubrace == "half-elf: peregrine" ||
            sSubrace == "peregrine" ||
            sSubrace == "peregrine half-elf" ||
            sSubrace == "peregrine halfelf" ||
            sSubrace == "peregrine half elf" ||
            sSubrace == "half-elf peregrine" ||
            sSubrace == "halfelf peregrine" ||
            sSubrace == "half elf peregrine")
        {
            //Standardize Subrace
            SetSubRace(oCreature, "Half-Elf: Peregrine");

            //Declare the new hide.
            sNewHide = "ww_sr_peregrine";
        }
        //Tainted Half-Elves
        if (sSubrace == "half-elf: tainted" ||
            sSubrace == "tainted" ||
            sSubrace == "tainted half-elf" ||
            sSubrace == "tainted halfelf" ||
            sSubrace == "tainted half elf" ||
            sSubrace == "half-elf tainted" ||
            sSubrace == "halfelf tainted" ||
            sSubrace == "half elf tainted" ||
            sSubrace == "tainted one")
        {
            //Standardize Subrace
            SetSubRace(oCreature, "Half-Elf: Tainted");

            //Declare the new hide.
            sNewHide = "ww_sr_tainted";
        }
        //Shadow Half-Elves
        if (sSubrace == "half-elf: shadow" ||
            sSubrace == "shadow" ||
            sSubrace == "shadow half-elf" ||
            sSubrace == "shadow halfelf" ||
            sSubrace == "shadow half elf" ||
            sSubrace == "dark half-elf" ||
            sSubrace == "dark halfelf" ||
            sSubrace == "dark half elf" ||
            sSubrace == "drow half-elf" ||
            sSubrace == "drow halfelf" ||
            sSubrace == "drow half elf" ||
            sSubrace == "half-drow" ||
            sSubrace == "halfdrow" ||
            sSubrace == "half drow" ||
            sSubrace == "drow")
        {
            //Standardize Subrace
            SetSubRace(oCreature, "Half-Elf: Shadow");

            //Declare the new hide.
            sNewHide = "ww_sr_shadow";
        }
        //Sylvan Half-Elves
        if (sSubrace == "half-elf: sylvan" ||
            sSubrace == "sylvan" ||
            sSubrace == "sylvan half-elf" ||
            sSubrace == "sylvan halfelf" ||
            sSubrace == "sylvan half elf" ||
            sSubrace == "forest" ||
            sSubrace == "forest half-elf" ||
            sSubrace == "forest halfelf" ||
            sSubrace == "forest half elf" ||
            sSubrace == "wood" ||
            sSubrace == "wood half-elf" ||
            sSubrace == "wood halfelf" ||
            sSubrace == "wood half elf" ||
            sSubrace == "green" ||
            sSubrace == "green half-elf" ||
            sSubrace == "green halfelf" ||
            sSubrace == "green half elf" ||
            sSubrace == "tree" ||
            sSubrace == "tree half-elf" ||
            sSubrace == "tree halfelf" ||
            sSubrace == "tree half elf")
        {
            //Standardize Subrace
            SetSubRace(oCreature, "Half-Elf: Sylvan");

            //Declare the new hide.
            sNewHide = "ww_sr_sylvan";

            //Add the Tracking device if they don't already have it.
            object oTracker = GetItemPossessedBy(oCreature, "WW_Tracker");
            if (oTracker == OBJECT_INVALID)
            {
                CreateItemOnObject("trackertool", oCreature);
            }
        }
        //Half-Elf Nomads
        if (sSubrace == "half-elf: nomad" ||
            sSubrace == "nomad" ||
            sSubrace == "nomad half-elf" ||
            sSubrace == "nomad halfelf" ||
            sSubrace == "nomad half elf" ||
            sSubrace == "half-elf nomad" ||
            sSubrace == "halfelf nomad" ||
            sSubrace == "half elf nomad" ||
            sSubrace == "undead" ||
            sSubrace == "undead half-elf" ||
            sSubrace == "undead halfelf" ||
            sSubrace == "undead half elf")
        {
            //Standardize Subrace
            SetSubRace(oCreature, "Half-Elf: Nomad");

            //Declare the new hide.
            sNewHide = "ww_sr_nomad";
        }
    }
    if (iRace == RACIAL_TYPE_HALFORC)
    {
        //Earth-Touched Half-Orcs
        if (sSubrace == "half-orc: earth-touched" ||
            sSubrace == "earth" ||
            sSubrace == "earth-touched" ||
            sSubrace == "earth-touched half-orc" ||
            sSubrace == "earth-touched halforc" ||
            sSubrace == "earth-touched half orc" ||
            sSubrace == "earth touched" ||
            sSubrace == "earth touched half-orc" ||
            sSubrace == "earth touched halforc" ||
            sSubrace == "earth touched half orc" ||
            sSubrace == "earth half-orc" ||
            sSubrace == "earth halforc" ||
            sSubrace == "earth half orc")
        {
            //Standardize Subrace
            SetSubRace(oCreature, "Half-Orc: Earth-Touched");

            //Declare the new hide.
            sNewHide = "ww_sr_earth";
        }
        //Fire-Touched Half-Orcs
        if (sSubrace == "half-orc: fire-touched" ||
            sSubrace == "fire" ||
            sSubrace == "fire-touched" ||
            sSubrace == "fire-touched half-orc" ||
            sSubrace == "fire-touched halforc" ||
            sSubrace == "fire-touched half orc" ||
            sSubrace == "fire touched" ||
            sSubrace == "fire touched half-orc" ||
            sSubrace == "fire touched halforc" ||
            sSubrace == "fire touched half orc" ||
            sSubrace == "fire half-orc" ||
            sSubrace == "fire halforc" ||
            sSubrace == "fire half orc")
        {
            //Standardize Subrace
            SetSubRace(oCreature, "Half-Orc: Fire-Touched");

            //Declare the new hide.
            sNewHide = "ww_sr_fire";
        }
        //Peregrine Half-Orc
        if (sSubrace == "half-orc: peregrine" ||
            sSubrace == "peregrine" ||
            sSubrace == "peregrine half-orc" ||
            sSubrace == "peregrine halforc" ||
            sSubrace == "peregrine half orc" ||
            sSubrace == "half-orc peregrine" ||
            sSubrace == "halforc peregrine" ||
            sSubrace == "half orc peregrine")
        {
            //Standardize Subrace
            SetSubRace(oCreature, "Half-Orc: Peregrine");

            //Declare the new hide.
            sNewHide = "ww_sr_peregrine";
        }
        //Tainted Humans
        if (sSubrace == "half-orc: tainted" ||
            sSubrace == "tainted" ||
            sSubrace == "tainted half-orc" ||
            sSubrace == "tainted halforc" ||
            sSubrace == "tainted half orc" ||
            sSubrace == "half-orc tainted" ||
            sSubrace == "halforc tainted" ||
            sSubrace == "half orc tainted" ||
            sSubrace == "tainted one")
        {
            //Standardize Subrace
            SetSubRace(oCreature, "Half-Orc: Tainted");

            //Declare the new hide.
            sNewHide = "ww_sr_tainted";
        }
        //Sojourner Half-Orcs
        if (sSubrace == "half-orc: sojourner" ||
            sSubrace == "sojourner" ||
            sSubrace == "sojourner half-orc" ||
            sSubrace == "sojourner halforc" ||
            sSubrace == "sojourner half orc" ||
            sSubrace == "half-orc sojourner" ||
            sSubrace == "halforc sojourner" ||
            sSubrace == "half orc sojourner" ||
            sSubrace == "undead" ||
            sSubrace == "undead half-orc" ||
            sSubrace == "undead halforc" ||
            sSubrace == "undead half orc")
        {
            //Standardize Subrace
            SetSubRace(oCreature, "Half-Orc: Sojourner");

            //Declare the new hide.
            sNewHide = "ww_sr_sojourner";
        }
    }
    if (iRace == RACIAL_TYPE_HUMAN)
    {
        //Air-Touched Humans
        if (sSubrace == "human: air-touched" ||
            sSubrace == "air" ||
            sSubrace == "air-touched" ||
            sSubrace == "air-touched human" ||
            sSubrace == "air touched" ||
            sSubrace == "air touched human" ||
            sSubrace == "air human")
        {
            //Standardize Subrace
            SetSubRace(oCreature, "Human: Air-Touched");

            //Declare the new hide.
            sNewHide = "ww_sr_air";
        }
        //Water-Touched Humans
        if (sSubrace == "human: water-touched" ||
            sSubrace == "water" ||
            sSubrace == "water-touched" ||
            sSubrace == "water-touched human" ||
            sSubrace == "water touched" ||
            sSubrace == "water touched human" ||
            sSubrace == "water human")
        {
            //Standardize Subrace
            SetSubRace(oCreature, "Human: Water-Touched");

            //Declare the new hide.
            sNewHide = "ww_sr_water";
        }
        //Earth-Touched Humans
        if (sSubrace == "human: earth-touched" ||
            sSubrace == "earth" ||
            sSubrace == "earth-touched" ||
            sSubrace == "earth-touched human" ||
            sSubrace == "earth touched" ||
            sSubrace == "earth touched human" ||
            sSubrace == "earth human")
        {
            //Standardize Subrace
            SetSubRace(oCreature, "Human: Earth-Touched");

            //Declare the new hide.
            sNewHide = "ww_sr_earth";
        }
        //Fire-Touched Humans
        if (sSubrace == "human: fire-touched" ||
            sSubrace == "fire" ||
            sSubrace == "fire-touched" ||
            sSubrace == "fire-touched human" ||
            sSubrace == "fire touched" ||
            sSubrace == "fire touched human" ||
            sSubrace == "fire human")
        {
            //Standardize Subrace
            SetSubRace(oCreature, "Human: Fire-Touched");

            //Declare the new hide.
            sNewHide = "ww_sr_fire";
        }
        //Peregrine Humans
        if (sSubrace == "human: peregrine" ||
            sSubrace == "peregrine" ||
            sSubrace == "peregrine human" ||
            sSubrace == "human peregrine")
        {
            //Standardize Subrace
            SetSubRace(oCreature, "Human: Peregrine");

            //Declare the new hide.
            sNewHide = "ww_sr_peregrine";
        }
        //Tainted Humans
        if (sSubrace == "human: tainted" ||
            sSubrace == "tainted" ||
            sSubrace == "tainted human" ||
            sSubrace == "human tainted" ||
            sSubrace == "tainted one")
        {
            //Standardize Subrace
            SetSubRace(oCreature, "Human: Tainted");

            //Declare the new hide.
            sNewHide = "ww_sr_tainted";
        }
    }

    //If a new hide has been declared...
    if (sNewHide != "")
    {
        //Create the hide on the creature.
        object oNewHide = CreateItemOnObject(sNewHide, oCreature);
        //ID it to ensure that it can be equipped.
        SetIdentified(oNewHide, TRUE);
        //Remove any potential plot flags so the negative properties get applied
        SetPlotFlag(oCreature, FALSE);
        //Ensure the creature is commandable
        SetCommandable(TRUE, oCreature);
        //Clear their actions
        AssignCommand(oCreature, ClearAllActions(TRUE));
        //Equip the hide
        AssignCommand(oCreature, ActionEquipItem(oNewHide, INVENTORY_SLOT_CARMOUR));
        //Return their plot flag to its previous state
        DelayCommand(1.0, SetPlotFlag(oCreature, bPlotFlagState));
        //Return their commandable flag to its previous state
        DelayCommand(1.1, SetCommandable(bCommandableState, oCreature));
    }
}
