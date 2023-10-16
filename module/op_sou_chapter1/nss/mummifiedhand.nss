//::///////////////////////////////////////////////
//:: Name: mummifiedhand
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Mummifiedhand on Activate Script
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 28/03
//:://////////////////////////////////////////////

void SetPCFacing(object oPC, float fFacing);
void CreateFireLine(location lFirePoint);
float GetTargetFacing(object oPC);

void main()
{
    // Get the activator
    object oPC = GetItemActivator();

    // Get the hand
    object oHand = GetItemActivated();

    //effects
    effect eVis1 = EffectVisualEffect(VFX_FNF_PWKILL);
    effect eVis2 = EffectVisualEffect(VFX_IMP_DEATH_WARD);
    effect eVis3 = EffectVisualEffect(VFX_IMP_STUN);
    effect eVis4 = EffectVisualEffect(VFX_IMP_BREACH);

    AssignCommand(oPC, ClearAllActions(TRUE));
    //SetCommandable(FALSE, oPC);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectLinkEffects(eVis1, eVis2), GetLocation(oPC));

    //Get the target facing - depends on the area the PC is in and which
    //artifacts have been discovered
    float fTargetFacing = GetTargetFacing(oPC);
    //need to do these checks to wrap around from 0 to 360- otherwise you get an endless loop
    if (fTargetFacing < 0.0)
        fTargetFacing = 360.0 + fTargetFacing;

    //Get the PCs current facing and and 1 to it until he's facing the target facing
    float fFacing = GetFacing(oPC);

    float fDelay = 0.0;
    int bTurn = TRUE;
    while(bTurn == TRUE)
    {
        //need to do these checks to wrap around from 0 to 360- otherwise you get an endless loop
        fFacing = fFacing + 1.0;
        if (fFacing > 360.0)
            fFacing = 0.0;
        DelayCommand(fDelay, SetPCFacing(oPC, fFacing));
        fDelay = fDelay + 0.01;

        if (fFacing > fTargetFacing - 2.0 && fFacing < fTargetFacing + 2.0)
        {
            bTurn = FALSE;

        }
    }

    //Apply Effects in the desired direction
    DelayCommand(fDelay/2.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectLinkEffects(eVis3, eVis4), GetLocation(oPC)));
    DelayCommand(fDelay + 1.0, FloatingTextStrRefOnCreature(40417, oPC));

    vector vPoint;
    vector vPC = GetPosition(oPC);
    vPoint = Vector((cos(fFacing) * 2.0) + vPC.x, (sin(fFacing) * 2.0) + vPC.y, vPC.z);
    location lPoint1 = Location(GetArea(oPC), vPoint, 0.0);

    vPoint = Vector((cos(fFacing) * 4.0) + vPC.x, (sin(fFacing) * 4.0) + vPC.y, vPC.z);
    location lPoint2 = Location(GetArea(oPC), vPoint, 0.0);

    vPoint = Vector((cos(fFacing) * 6.0) + vPC.x, (sin(fFacing) * 6.0) + vPC.y, vPC.z);
    location lPoint3 = Location(GetArea(oPC), vPoint, 0.0);

    vPoint = Vector((cos(fFacing) * 8.0) + vPC.x, (sin(fFacing) * 8.0) + vPC.y, vPC.z);
    location lPoint4 = Location(GetArea(oPC), vPoint, 0.0);

    vPoint = Vector((cos(fFacing) * 10.0) + vPC.x, (sin(fFacing) * 10.0) + vPC.y, vPC.z);
    location lPoint5 = Location(GetArea(oPC), vPoint, 0.0);

    vPoint = Vector((cos(fFacing) * 12.0) + vPC.x, (sin(fFacing) * 12.0) + vPC.y, vPC.z);
    location lPoint6 = Location(GetArea(oPC), vPoint, 0.0);

    vPoint = Vector((cos(fFacing) * 14.0) + vPC.x, (sin(fFacing) * 14.0) + vPC.y, vPC.z);
    location lPoint7 = Location(GetArea(oPC), vPoint, 0.0);

    DelayCommand(fDelay, CreateFireLine(lPoint1));
    DelayCommand(fDelay + 0.5, CreateFireLine(lPoint2));
    DelayCommand(fDelay + 1.0, CreateFireLine(lPoint3));
    DelayCommand(fDelay + 1.5, CreateFireLine(lPoint4));
    DelayCommand(fDelay + 2.0, CreateFireLine(lPoint5));
    DelayCommand(fDelay + 2.5, CreateFireLine(lPoint6));
    DelayCommand(fDelay + 3.0, CreateFireLine(lPoint7));
}

void SetPCFacing(object oPC, float fFacing)
{

    AssignCommand(oPC, SetFacing(fFacing));

}
void CreateFireLine(location lFirePoint)
{                                                 //firelarge, sparkstest, soltest, dusttest

    object oFire = CreateObject(OBJECT_TYPE_PLACEABLE, "flamelarge", lFirePoint);
    DestroyObject(oFire, 1.75);
    ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_DUR_PROT_PREMONITION), lFirePoint, 1.75);
}

float GetTargetFacing(object oPC)
{
    //Check which artifacts have been recovered.
    int nTower = GetLocalInt(GetModule(), "X1_RECOVERTOWER");
    int nMask = GetLocalInt(GetModule(), "X1_RECOVERMASK");
    int nTooth = GetLocalInt(GetModule(), "X1_RECOVERTOOTH");
    int nDeekin = GetLocalInt(GetModule(), "X1_DEEKINTALKED");

    float fFacing = 0.0;
    object oTarget;
    //If the PC is in the foothills
    if (GetTag(GetArea(oPC)) == "q1rural")
    {
        //Check which artifacts have been recovered.
        int nTower = GetLocalInt(GetModule(), "X1_RECOVERTOWER");
        int nMask = GetLocalInt(GetModule(), "X1_RECOVERMASK");
        int nTooth = GetLocalInt(GetModule(), "X1_RECOVERTOOTH");
        int nDeekin = GetLocalInt(GetModule(), "X1_DEEKINTALKED");
        //if none have been recovered and Deekin hasn't been talked to - point to blumberg
        if (nTower == 0 && nMask == 0 && nTooth == 0 && nDeekin == 0)
            oTarget = GetWaypointByTag("wp_hand_foothills_blumberg");
        //if the mask has not been recovered, point to the nether mountains
        else if (nMask == 0)
            oTarget = GetWaypointByTag("wp_hand_foothills_nether");
        //if the tooth has not been recovered, point to the high forest
        else if (nTooth == 0)
            oTarget = GetWaypointByTag("wp_hand_foothills_forest");
        //if the tower has not been recovered point to blumberg
        else if (nTower == 0)
            oTarget = GetWaypointByTag("wp_hand_foothills_blumberg");
        //else point to Drogan..or stop pointing..
        else
        {

        }

    }
    //if the PC in in the Nether Mountains
    else if (GetTag(GetArea(oPC)) == "q1nether")
    {
        //if the mask hasn't been recoverd - point to the caves
        if (nMask == 0)
            oTarget = GetWaypointByTag("wp_hand_gnollcave");
        //else point to the foothills
        else
            oTarget = GetWaypointByTag("wp_hand_nether_foothills");

    }
    //if the PC is in the High forest
    else if (GetTag(GetArea(oPC)) == "q7highforest")
    {
        if (nTooth == 0)
            oTarget = GetWaypointByTag("mn_gnollcave");
        else
            oTarget = GetWaypointByTag("mn_highforestentrance");
    }
    else if (GetTag(GetArea(oPC)) == "q2_ElvenCryptUpperLevel")
    {
        oTarget = GetWaypointByTag("wp_hand_elfcrypt1");
    }
    else if (GetTag(GetArea(oPC)) == "q2_ElvenCryptLowerLevel")
    {
        oTarget = GetWaypointByTag("wp_hand_elfcrypt2");
    }
    else if (GetTag(GetArea(oPC)) == "q6blumberg")
    {
        //if Deekin has never spawned before - point to his shop
        if (GetLocalInt(GetModule(), "X1_DeekinSpawn") == 2)
            oTarget = GetWaypointByTag("wp_hand_blumberg");//
        else
            oTarget = GetWaypointByTag("mn_deeking_blumberg");//
    }
    else if (GetTag(GetArea(oPC)) == "q1a2drogonfloor2")
    {
        oTarget = GetWaypointByTag("wp_hand_drogan2");

    }
    else if (GetTag(GetArea(oPC)) == "q1a3drogancellar")
    {
        oTarget = GetWaypointByTag("wp_hand_drogan3");//
    }
    else if (GetTag(GetArea(oPC)) == "q1a1drogonfloor1")
    {
        oTarget = GetWaypointByTag("wp_hand_drogan1");      //
    }
    else if (GetTag(GetArea(oPC)) == "q1bhilltopeast")
    {
        oTarget = GetWaypointByTag("wp_hand_hilltop");        //
    }
    else if (GetTag(GetArea(oPC)) == "q1bhilltopwest")
    {
        oTarget = GetWaypointByTag("mn_q1bwestgates");        //
    }
    else if (GetTag(GetArea(oPC)) == "q1hblakehouse")
    {
        oTarget = GetWaypointByTag("wp_hand_blake1");       //
    }
    else if (GetTag(GetArea(oPC)) == "q1h1_blakehouse")
    {
        oTarget = GetWaypointByTag("wp_hand_blake2");       //
    }
    else if (GetTag(GetArea(oPC)) == "q1ghall")
    {
        oTarget = GetWaypointByTag("wp_hand_hilltophall");     //
    }
    else if (GetTag(GetArea(oPC)) == "q1edroganbarn")
    {
        oTarget = GetWaypointByTag("wp_hand_droganbarn");    //
    }
    else if (GetTag(GetArea(oPC)) == "q1footfarm")
    {
        oTarget = GetWaypointByTag("wp_hand_hurstfarm");//
    }
    else if (GetTag(GetArea(oPC)) == "q1krumgut")
    {
        oTarget = GetWaypointByTag("wp_q1rumcave_exit");//
    }
    else if (GetTag(GetArea(oPC)) == "q1ifortune")
    {
        oTarget = GetWaypointByTag("wp_hand_fortuneteller");//
    }
    else if (GetTag(GetArea(oPC)) == "q1cherbalist")
    {
        oTarget = GetWaypointByTag("wp_hand_herbalist");//
    }
    else if (GetTag(GetArea(oPC)) == "q1bhouse1")
    {
        oTarget = GetWaypointByTag("wp_hand_hilltophouse1");//
    }
    else if (GetTag(GetArea(oPC)) == "q1bhouse2")
    {
        oTarget = GetWaypointByTag("wp_hand_hilltophouse2");//
    }
    else if (GetTag(GetArea(oPC)) == "q1bhouse3")
    {
        oTarget = GetWaypointByTag("wp_hand_hilltophouse3");//
    }
    else if (GetTag(GetArea(oPC)) == "q1bhouse4")
    {
        oTarget = GetWaypointByTag("wp_hand_hilltophouse4");    //
    }
    else if (GetTag(GetArea(oPC)) == "q1dtavern")
    {
        oTarget = GetWaypointByTag("wp_hand_cauldron");//
    }
    else if (GetTag(GetArea(oPC)) == "q1jfarm")
    {
        oTarget = GetWaypointByTag("wp_hand_oldfarm1");//
    }
    else if (GetTag(GetArea(oPC)) == "q1jcellar")
    {
        oTarget = GetWaypointByTag("wp_hand_oldfarm2");//
    }
    else if (GetTag(GetArea(oPC)) == "q1fsmith")
    {
        oTarget = GetWaypointByTag("wp_hand_smith");//
    }
    //EXCEPTION - just in case
    else
    {
        //Set Target to Blumberg
        oTarget = GetWaypointByTag("wp_hand_blumberg");
    }
    //originating vector
    vector vOriginate = GetPosition(oPC);
    vector vTarget = GetPosition(oTarget);
    fFacing = atan((vTarget.y - vOriginate.y)/(vTarget.x - vOriginate.x));

    return fFacing;

}
