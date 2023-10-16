//::///////////////////////////////////////////////
//:: Name act_q2blever_7
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Lower the appropriate pillar from the row that
    the lever controls.
     Rod Colour
    1 = Blue
    2 = Green
    3 = Red
    4 = White
    5 = Yellow

    Pillar Colours as of June 16/03
    Row 4   R   G   W
    Row 3   G   B   Y
    Row 2   R   B   W
    Row 1   G   Y   R
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 16/03
//:://////////////////////////////////////////////
void MovePillar(int nRow, int nColour);
void MakePillar(int nCount, location lTarget, string szResRef, string szRow, string szColour);

void main()
{
    object oPC = GetPCSpeaker();

    //Prevent multiple lever pulling
    if (GetLocalInt(OBJECT_SELF, "nPillarMoving") == 1)
    {
        FloatingTextStrRefOnCreature(84108, oPC);
        return;
    }

    //Play the lever animation
    if (GetLocalInt(OBJECT_SELF, "nActivate") == 0)
    {
        SetLocalInt(OBJECT_SELF, "nActivate", 1);
        PlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
    }
    else
    {
        SetLocalInt(OBJECT_SELF, "nActivate", 0);
        PlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE);
    }
    //Find out which row this lever controls
    string szRow = GetStringRight(GetTag(OBJECT_SELF), 1);
    int nRow = StringToInt(szRow);
    int nColour = GetLocalInt(OBJECT_SELF, "nRodColour");

    object oPillar;
    //Check the Pillars in Row 1 - only rods of the same colour will have an effect
    //There can be only 1 colour of each pillar per row
    if (nRow == 1)
    {
        oPillar = GetObjectByTag("q2bpillar1_" + IntToString(nColour));
        if (GetIsObjectValid(oPillar) == TRUE)
            MovePillar(nRow, nColour);
        else
            FloatingTextStrRefOnCreature(84109 , oPC);
    }
    else if (nRow == 2)
    {
        oPillar = GetObjectByTag("q2bpillar2_" + IntToString(nColour));
        if (GetIsObjectValid(oPillar) == TRUE)
            MovePillar(nRow, nColour);
        else
            FloatingTextStrRefOnCreature(84110 , oPC);
    }
    else if (nRow == 3)
    {
        oPillar = GetObjectByTag("q2bpillar3_" + IntToString(nColour));
        if (GetIsObjectValid(oPillar) == TRUE)
            MovePillar(nRow, nColour);
        else
            FloatingTextStrRefOnCreature(84112, oPC);
    }
    else if (nRow == 4)
    {
        oPillar = GetObjectByTag("q2bpillar4_" + IntToString(nColour));
        if (GetIsObjectValid(oPillar) == TRUE)
            MovePillar(nRow, nColour);
        else
            FloatingTextStrRefOnCreature(84112, oPC);
    }

}
//Find out which pillar should be moved according to the control row of the lever
//and the colour of rod that has been inserted into it.
void MovePillar(int nRow, int nColour)
{
    //Set a variable so that the lever can't be pulled again and again
    SetLocalInt(OBJECT_SELF, "nPillarMoving", 1);

    string szRow = IntToString(nRow);
    string szColour = IntToString(nColour);
    object oPillar = GetObjectByTag("q2bpillar" + szRow + "_" + szColour);


    string szResRef = GetResRef(oPillar);
    location lTarget = GetLocation(oPillar);
    DestroyObject(oPillar);
    int nCount = 0;
    for (nCount = 0; nCount< 16; nCount++)
    {

        DelayCommand(IntToFloat(nCount), MakePillar(nCount, lTarget, szResRef, szRow, szColour));
    }
}

//Creating a pillar - used so that the creation can be delayed via a function call
//Pass in the count which is used to control how low the pillar should be spawned
//in the z-axis
void MakePillar(int nCount, location lTarget, string szResRef, string szRow, string szColour)
{
    PlaySound("as_cv_brickscrp1");

    vector vTarget = GetPositionFromLocation(lTarget);
    vector vSpawn = Vector(vTarget.x, vTarget.y, vTarget.z - (IntToFloat(nCount)/4.0));
    location lSpawn = Location(GetArea(OBJECT_SELF), vSpawn, 0.0);

    //vector vVfx = Vector(vTarget.x, vTarget.y, vTarget.z - (IntToFloat(nCount)/4.0) + 12.0);
    //location lVfx = Location(GetArea(OBJECT_SELF), vSpawn, 0.0);

    string szTag = "q2bpillar" + szRow + "_" + szColour;
    object oPillar = CreateObject(OBJECT_TYPE_PLACEABLE, szResRef, lSpawn, FALSE, szTag);

    effect eVfx1;

    if (szColour == "1")
        eVfx1 = EffectVisualEffect(VFX_DUR_GLOW_BLUE);
    else if (szColour == "2")
        eVfx1 = EffectVisualEffect(VFX_DUR_GLOW_GREEN);
    else if (szColour == "3")
        eVfx1 = EffectVisualEffect(VFX_DUR_GLOW_RED);
    else if (szColour == "4")
        eVfx1 = EffectVisualEffect(VFX_DUR_GLOW_WHITE);
    else if (szColour == "5")
        eVfx1 = EffectVisualEffect(VFX_DUR_GLOW_YELLOW);

    if (nCount < 13)
    {
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVfx1, oPillar);

        DestroyObject(oPillar, 0.9);
    }
    else
    {
        SetLocalInt(OBJECT_SELF, "nPillarMoving", 0);
        SetLocalInt(oPillar, "nPillarLowered", 1);
        DestroyObject(oPillar, 0.9);
    }
}
