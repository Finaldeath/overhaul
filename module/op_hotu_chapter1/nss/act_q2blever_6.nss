//::///////////////////////////////////////////////
//:: Name act_q2blever_6
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Remove a Rod from the Lever
    Rod Colour
    0 = None
    1 = Blue
    2 = Green
    3 = Red
    4 = White
    5 = Yellow
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 16/03
//:://////////////////////////////////////////////
void RaisePillar(int nColour, string szRow);
void MakePillar(int nCount, location lTarget, string szResRef);
void main()
{
    object oPC = GetPCSpeaker();

    //Prevent multiple lever pulling
    if (GetLocalInt(OBJECT_SELF, "nPillarMoving") == 1)
    {
        FloatingTextStrRefOnCreature(84107, oPC);
        return;
    }

    int nColour = GetLocalInt(OBJECT_SELF, "nRodColour");
    string szRow = GetStringRight(GetTag(OBJECT_SELF), 1);

    //Give the rod back to the PC
    switch (nColour)
    {
        case 1:     CreateItemOnObject("q2brodblue", oPC);
                    break;
        case 2:     CreateItemOnObject("q2brodgreen", oPC);
                    break;
        case 3:     CreateItemOnObject("q2brodred", oPC);
                    break;
        case 4:     CreateItemOnObject("q2brodwhite", oPC);
                    break;
        case 5:     CreateItemOnObject("q2brodyellow", oPC);
                    break;

    }
    object oPillar;
    int nRow = StringToInt(szRow);

    SetLocalInt(OBJECT_SELF, "nRodColour", 0);
}

//Find out which pillar should be raised according to the control row of the lever
//and the colour of rod that had been inserted into it.
void RaisePillar(int nColour, string szRow)
{
    //Get the original pillar and its location and destroy it.
    string szColour = IntToString(nColour);
    object oPillar = GetObjectByTag("q2bpillar" + szRow + "_" + szColour);

    //if the pillar has never been lowered - do nothing
    if (GetLocalInt(oPillar, "nPillarLowered") == 0)

        return;

    //Set a variable so that the lever can't be pulled again and again
    SetLocalInt(OBJECT_SELF, "nPillarMoving", 1);

    location lTarget = GetLocation(oPillar);
    DestroyObject(oPillar);

    //Colour will stay the same as the pillar that was lowered
    int nNewColour = nColour;
    string szNewColour = IntToString(nNewColour);


    //Create the new ResRef depending on which colour was picked
    string szResRef;
    switch (nNewColour)
    {
        case 1: szResRef = "q2bpillarx_1";
                break;
        case 2: szResRef = "q2bpillarx_2";
                break;
        case 3: szResRef = "q2bpillarx_3";
                break;
        case 4: szResRef = "q2bpillarx_4";
                break;
        case 5: szResRef = "q2bpillarx_5";
                break;
    }
    //Make the pillar 'rise' from the ground
    int nCount = 0;
    for (nCount = 0; nCount< 16; nCount++)
    {

        DelayCommand(IntToFloat(nCount), MakePillar(nCount, lTarget, szResRef));
    }
}

//Creating a pillar - used so that the creation can be delayed via a function call
//Pass in the count which is used to control how low the pillar should be spawned
//in the z-axis
void MakePillar(int nCount, location lTarget, string szResRef)
{


    PlaySound("as_cv_brickscrp1");
    vector vTarget = GetPositionFromLocation(lTarget);
    vector vSpawn = Vector(vTarget.x, vTarget.y, vTarget.z + (IntToFloat(nCount)/4.0));
    location lSpawn = Location(GetArea(OBJECT_SELF), vSpawn, 0.0);
    object oPillar = CreateObject(OBJECT_TYPE_PLACEABLE, szResRef, lSpawn);

    effect eVfx1;

    if (szResRef == "q2bpillarx_1")
        eVfx1 = EffectVisualEffect(VFX_DUR_GLOW_BLUE);
    else if (szResRef == "q2bpillarx_2")
        eVfx1 = EffectVisualEffect(VFX_DUR_GLOW_GREEN);
    else if (szResRef == "q2bpillarx_3")
        eVfx1 = EffectVisualEffect(VFX_DUR_GLOW_RED);
    else if (szResRef == "q2bpillarx_4")
        eVfx1 = EffectVisualEffect(VFX_DUR_GLOW_WHITE);
    else if (szResRef == "q2bpillarx_5")
        eVfx1 = EffectVisualEffect(VFX_DUR_GLOW_YELLOW);

    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVfx1, oPillar);
    if (nCount < 13)
        DestroyObject(oPillar, 0.9);
    else
         SetLocalInt(OBJECT_SELF, "nPillarMoving", 0);
}
