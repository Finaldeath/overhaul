//::///////////////////////////////////////////////
//:: Name hx_cyrstal_start
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Starts the crystal cutscenes.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Sept 25, 2003
//:://////////////////////////////////////////////
void ResolveOldCrystals(object oSelf = OBJECT_SELF);
void main()
{
    location lLoc;
    object oSound = GetNearestObjectByTag("hx_crsyt_snd");

    if(GetTag(OBJECT_SELF) == "hx_crystal_1")
    {
        lLoc = GetLocation(GetObjectByTag("hx_crystal_pc_start_wp"));
        //Ensure that it's the Scrivener's Master who left.
        object oPC = GetPCSpeaker();
        object oScrivener = GetObjectByTag("H2_Scrivener");
        object oMaster = GetMaster(oScrivener);
        if (oPC == oMaster)
        {
            //Remove the Scrivener from the party.
            RemoveHenchman(oPC, oScrivener);
            AssignCommand(oScrivener, ClearAllActions());
            SetLocalInt(oScrivener, "X2_JUST_A_FOLLOWER", FALSE);
        }
    }
    else if(GetTag(OBJECT_SELF) == "hx_crystal_2")
    {
        lLoc = GetLocation(GetObjectByTag("hx_crystal2_pc_start_wp"));
    }
    else
    {
        lLoc = GetLocation(GetObjectByTag("hx_crystal3_pc_start_wp"));
    }

    SetLocalInt(GetArea(OBJECT_SELF), "HX_CRYSTAL1_CUTSCENE", 1);
    PlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE);
    SoundObjectStop(oSound);
    ResolveOldCrystals();
    AssignCommand(GetPCSpeaker(), ActionJumpToLocation(lLoc));
}

void ResolveOldCrystals(object oSelf = OBJECT_SELF)
{
    object oCrystal1;
    object oCrystal2;
    object oSound1;
    object oSound2;
    string sTag = GetTag(oSelf);

    if(sTag == "hx_crystal_2")
    {
        oCrystal1 = GetObjectByTag("hx_crystal_1");
        oSound1 = GetNearestObjectByTag("hx_crsyt_snd", oCrystal1);
        // Deactivate them.
        SetLocalInt(GetArea(oCrystal1), "HX_CRYSTAL1_CUTSCENE", 1);
        AssignCommand(oCrystal1, PlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE));
        SoundObjectStop(oSound1);
    }
    else if(sTag == "hx_crystal_3")
    {
        oCrystal1 = GetObjectByTag("hx_crystal_1");
        oSound1 = GetNearestObjectByTag("hx_crsyt_snd", oCrystal1);
        // Deactivate them.
        SetLocalInt(GetArea(oCrystal1), "HX_CRYSTAL1_CUTSCENE", 1);
        AssignCommand(oCrystal1, PlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE));
        SoundObjectStop(oSound1);

        oCrystal2 = GetObjectByTag("hx_crystal_2");
        oSound2 = GetNearestObjectByTag("hx_crsyt_snd", oCrystal2);
        // Deactivate them.
        SetLocalInt(GetArea(oCrystal2), "HX_CRYSTAL1_CUTSCENE", 1);
        AssignCommand(oCrystal2, PlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE));
        SoundObjectStop(oSound2);
    }
    else
    {
        return;
    }
}
