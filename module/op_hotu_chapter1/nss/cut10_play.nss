//::///////////////////////////////////////////////
//:: Name
//:: FileName
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
        Midway through cutscene 5 (the council chamber scene),
        The PC (and party) will be teleported to the scene of
        the battle in the University District.  It will show
        fighting/spell casting between the Drow/Duerger forces
        and the forces of the city.  Stuff will be smashed,
        people killed, gates busted open, drow running rampant.
        At the end, the PC will be teleported back to the
        Council Chamber and that scene will continue
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: October 31/02
//:://////////////////////////////////////////////

void RunCinematic(object oPC);
void RemoveDominate(object oObject);
void MakeCreature(location lTarget, string sCreature);
void Jump(object oPC, string sWay);
void JumpMultiPlayer(string sWay);
void PlayAni(int nAnimation, float fLength);
void Move(object oTarget);
void MoveToLoc(location lTarget);
void SetCamera(float fFacing, float fZoom);

void SetCreatureFacing(string szTag);
void SetFloatFacing(float fFacing);



void main()
{
    //Get the entering object
    object oPC = GetEnteringObject();
    if (!GetIsPC(oPC))
    {
        return;
    }

    if (GetIsPC(oPC))
    {
        //Apply the dominated/cutscene effect to the enterer here
        DelayCommand(0.2, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectCutsceneDominated(), oPC));
        // DelayCommand(4.0, RemoveDominate(oPC));
        //Might have to do a check for PC associates here as well...
        //Unsummon any animal companions and freeze any henchmen
            object oAnimal = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oPC);
            object oDominated = GetAssociate(ASSOCIATE_TYPE_DOMINATED, oPC);
            object oFamiliar = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oPC);
            object oSummoned = GetAssociate(ASSOCIATE_TYPE_SUMMONED, oPC);
            //object oHench = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oPC);

            if (oAnimal != OBJECT_INVALID)
                DestroyObject(oAnimal);
            if (oDominated != OBJECT_INVALID)
                DestroyObject(oDominated);
            if (oFamiliar != OBJECT_INVALID)
                DestroyObject(oFamiliar);
            if (oSummoned != OBJECT_INVALID)
                DestroyObject(oSummoned);

        RemoveDominate(oPC);
        //Set PC and all associates to invisible
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectInvisibility(INVISIBILITY_TYPE_DARKNESS), oPC);

        //run the cutscene

            RunCinematic(oPC);

        //else the cutscene is already running so any extra PCs are just witnesses.
        //they should be forced to follow the leader
    }
    else
    {

       ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectInvisibility(INVISIBILITY_TYPE_DARKNESS), oPC);

    }
}

void RunCinematic(object oPC)
{
    location lTarget1 = GetLocation(GetWaypointByTag("wp_cut10_loc1"));
    location lTarget2 = GetLocation(GetWaypointByTag("wp_cut10_loc2"));
    location lTarget3 = GetLocation(GetWaypointByTag("wp_cut10_loc3"));

    location lBad1 = GetLocation(GetWaypointByTag("wp_cut10_b1"));
    location lBad2 = GetLocation(GetWaypointByTag("wp_cut10_b2"));
    location lBad3 = GetLocation(GetWaypointByTag("wp_cut10_b3"));
    location lBad4 = GetLocation(GetWaypointByTag("wp_cut10_b4"));
    location lBad5 = GetLocation(GetWaypointByTag("wp_cut10_b5"));
    location lBad6 = GetLocation(GetWaypointByTag("wp_cut10_b6"));
    location lBad7 = GetLocation(GetWaypointByTag("wp_cut10_b7"));
    location lBad8 = GetLocation(GetWaypointByTag("wp_cut10_b8"));
    location lBad9 = GetLocation(GetWaypointByTag("wp_cut10_b9"));
    location lBad10 = GetLocation(GetWaypointByTag("wp_cut10_b10"));
    location lBad11 = GetLocation(GetWaypointByTag("wp_cut10_b11"));
    location lBad12 = GetLocation(GetWaypointByTag("wp_cut10_b12"));

    location lBadM1 = GetLocation(GetWaypointByTag("wp_cut10_bm1"));
    location lBadM2 = GetLocation(GetWaypointByTag("wp_cut10_bm2"));
    location lBadM3 = GetLocation(GetWaypointByTag("wp_cut10_bm3"));
    location lBadM4 = GetLocation(GetWaypointByTag("wp_cut10_bm4"));
    location lBadM5 = GetLocation(GetWaypointByTag("wp_cut10_bm5"));
    location lBadM6 = GetLocation(GetWaypointByTag("wp_cut10_bm6"));
    location lBomb1 = GetLocation(GetWaypointByTag("wp_cut10_bomb1"));
    location lBomb2 = GetLocation(GetWaypointByTag("wp_cut10_bomb2"));

    location lGood1 = GetLocation(GetWaypointByTag("wp_cut10_g1"));
    location lGood2 = GetLocation(GetWaypointByTag("wp_cut10_g2"));
    location lGood3 = GetLocation(GetWaypointByTag("wp_cut10_g3"));
    location lGood4 = GetLocation(GetWaypointByTag("wp_cut10_g4"));
    location lGood5 = GetLocation(GetWaypointByTag("wp_cut10_g5"));
    location lGood6 = GetLocation(GetWaypointByTag("wp_cut10_g6"));
    location lGood7 = GetLocation(GetWaypointByTag("wp_cut10_g7"));
    location lGood8 = GetLocation(GetWaypointByTag("wp_cut10_g8"));
    location lGood9 = GetLocation(GetWaypointByTag("wp_cut10_g9"));
    location lGood10 = GetLocation(GetWaypointByTag("wp_cut10_g10"));
    location lGood11 = GetLocation(GetWaypointByTag("wp_cut10_g11"));
    location lGood12 = GetLocation(GetWaypointByTag("wp_cut10_g12"));
    location lGood13 = GetLocation(GetWaypointByTag("wp_cut10_g13"));
    location lGood14 = GetLocation(GetWaypointByTag("wp_cut10_g14"));
    location lGood15 = GetLocation(GetWaypointByTag("wp_cut10_g15"));
    location lGood16 = GetLocation(GetWaypointByTag("wp_cut10_g16"));
    location lGood17 = GetLocation(GetWaypointByTag("wp_cut10_g17"));

    location lGoodM1 = GetLocation(GetWaypointByTag("wp_cut10_gm1"));
    location lGoodM2 = GetLocation(GetWaypointByTag("wp_cut10_gm2"));
    location lGoodM3 = GetLocation(GetWaypointByTag("wp_cut10_gm3"));
    location lGoodM4 = GetLocation(GetWaypointByTag("wp_cut10_gm4"));
    location lGoodM5 = GetLocation(GetWaypointByTag("wp_cut10_gm5"));

    object oCatapult = GetObjectByTag("cut10_catapult1");
    object oCatapult2 = GetObjectByTag("cut10_cat2");
    object oGate1 = GetObjectByTag("cut10_door1");
    object oGoodCatapult = GetObjectByTag("cut10_good_l1");
    object oTarget1 = GetObjectByTag("cut10_target1");
    object oTarget2 = GetObjectByTag("cut10_target2");
    object oTarget3 = GetObjectByTag("cut10_target3");

    //Create the armies...
    MakeCreature(lBad1, "cut10_dwar");
    MakeCreature(lBad2, "cut10_dwar");
    MakeCreature(lBad3, "cut10_dwar");
    MakeCreature(lBad4, "cut1_drow");
    MakeCreature(lBad5, "cut1_drow");
    MakeCreature(lBad6, "cut1_drow");
    MakeCreature(lBad7, "cut1_drow");

    MakeCreature(lBomb1, "cut10_dwar");
    MakeCreature(lBomb2, "cut10_dwar");
    MakeCreature(lBadM1, "cut10_dwiz");
    MakeCreature(lBadM2, "cut10_drow_wiz");
    MakeCreature(lBadM5, "cut10_drow_wiz");
    MakeCreature(lBadM6, "cut10_dwiz");

    MakeCreature(lGood1, "cut10_militia");
    MakeCreature(lGood2, "cut10_militia");
    MakeCreature(lGood3, "cut10_militia");
    MakeCreature(lGood4, "cut10_militia");
    MakeCreature(lGood5, "cut10_gwiz");
    MakeCreature(lGood6, "cut10_militia");
    MakeCreature(lGood7, "cut10_militia");
    MakeCreature(lGood8, "cut10_militia");
    MakeCreature(lGood9, "cut10_militia");
    MakeCreature(lGood10, "cut10_militia");
    MakeCreature(lGoodM1, "cut10_gwiz");
    MakeCreature(lGoodM2, "cut10_gwiz");
    MakeCreature(lGood14, "cut10_militia");
    MakeCreature(lGood15, "cut10_militia");
    MakeCreature(lGood16, "cut10_gwiz");
    MakeCreature(lGood17, "cut10_militia");

    //Set the camera modes
    //Camera Facing for cutscene
    float fDelay = 9.0;
    float fZoom = 20.0;
    float fPitch = 50.0;
    float fCameraFacing = 90.0;


    AssignCommand(oPC, DelayCommand(6.0, SetCameraFacing(fCameraFacing, fZoom, fPitch, CAMERA_TRANSITION_TYPE_SNAP )));
    fCameraFacing = 180.0;
    AssignCommand(oPC, DelayCommand(9.0, SetCameraFacing(fCameraFacing, fZoom, fPitch, CAMERA_TRANSITION_TYPE_SLOW )));
    fCameraFacing = 270.0;
    AssignCommand(oPC, DelayCommand(30.0, SetCameraFacing(fCameraFacing, fZoom, fPitch, CAMERA_TRANSITION_TYPE_SLOW )));


    //Move PC to First Waypoint  (15.0)
    DelayCommand(12.0, AssignCommand(oPC, MoveToLoc(lTarget1)));

    //Hit Gate with a fireball  (35.0)
    DelayCommand(13.0, AssignCommand(oCatapult, ActionCastFakeSpellAtObject(SPELL_FIREBALL, oGate1, PROJECTILE_PATH_TYPE_BALLISTIC)));
    DelayCommand(14.0, MakeCreature(lBad11, "cut10_dwar"));
    DelayCommand(14.0, MakeCreature(lBad12, "cut1_drow"));
    DelayCommand(15.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(30), oGate1));

    //Should add some VFX here
    //Destroy Gate (37.0
    //DelayCommand(9.0, DestroyObject(oGate1));

    //Move PC to Second Waypoint (45.0)
    DelayCommand(18.0, AssignCommand(oPC, MoveToLoc(lTarget2)));
    DelayCommand(16.0, MakeCreature(lBad8, "cut10_drow"));
    DelayCommand(17.0, MakeCreature(lBad9, "cut10_dwar"));
    DelayCommand(17.0, MakeCreature(lBad10, "cut10_dwar"));
    DelayCommand(17.0, MakeCreature(lBadM3, "cut10_dwiz"));
    DelayCommand(17.0, MakeCreature(lBadM4, "cut10_drow_wiz"));

    DelayCommand(17.0, MakeCreature(lGoodM3, "cut10_gwiz"));
    DelayCommand(17.0, MakeCreature(lGoodM4, "cut10_gwiz"));
    DelayCommand(17.0, MakeCreature(lGoodM5, "cut10_gwiz"));
    DelayCommand(17.0, MakeCreature(lGood11, "cut10_militia"));
    DelayCommand(17.0, MakeCreature(lGood12, "cut10_militia"));
    DelayCommand(17.0, MakeCreature(lGood13, "cut10_militia"));

    DelayCommand(18.0, AssignCommand(oGoodCatapult, ActionCastFakeSpellAtObject(SPELL_FIREBALL, oTarget1, PROJECTILE_PATH_TYPE_BALLISTIC)));
    DelayCommand(25.0, AssignCommand(oCatapult, ActionCastFakeSpellAtObject(SPELL_FIREBALL, oTarget2, PROJECTILE_PATH_TYPE_BALLISTIC)));
    DelayCommand(25.5, AssignCommand(oCatapult2, ActionCastFakeSpellAtObject(SPELL_FIREBALL, oTarget3, PROJECTILE_PATH_TYPE_BALLISTIC)));
    //Move PC to Third Waypoint (75.0)

    DelayCommand(40.0, AssignCommand(oPC, MoveToLoc(lTarget3)));

    //85.0, 90.0
    DelayCommand(55.0, RemoveDominate(oPC));
    DelayCommand(55.0, SetLocalInt(GetModule(), "nUniTelescopeUsed", 0));
    DelayCommand(56.0, AssignCommand(oPC, Jump(oPC, "wp_q2a2_cut10end")));


}

// Remove all effects from the PC.
void RemoveDominate(object oObject)
{
   effect eEff = GetFirstEffect(oObject);

   while(GetIsEffectValid(eEff))
   {
      RemoveEffect(oObject, eEff);
      eEff = GetNextEffect(oObject);
   }
}


void MakeCreature(location lTarget, string sCreature )
{
    //if (GetLocalInt(GetModule(), "nCut10Skipped") != 1)
    //{
        CreateObject(OBJECT_TYPE_CREATURE, sCreature, lTarget);
    //}
}
void MoveToLoc(location lTarget)
{
    if (GetLocalInt(GetModule(), "nCut10Skipped") != 1)
    {
        SetCommandable( TRUE );
        ActionMoveToLocation(lTarget);
        SetCommandable( FALSE );
    }
}
void SetFloatFacing(float fFacing)
{
    if (GetLocalInt(GetModule(), "nCut10Skipped") != 1)
    {
        SetCommandable( TRUE );
        SetFacing(fFacing);
        SetCommandable( FALSE );
    }
}
void SetCreatureFacing(string szTag)
{
    if (GetLocalInt(GetModule(), "nCut10Skipped") != 1)
    {
        SetCommandable( TRUE );
        SetFacingPoint(GetPosition(GetObjectByTag("szTag")));
        SetCommandable( FALSE );
    }
}

void PCSpeak(string szStringToSay)
{
    if (GetLocalInt(GetModule(), "nCut10Skipped") != 1)
    {
        SpeakString(szStringToSay);
    }
}

void SetCamera(float fFacing, float fZoom)
{
    if (GetLocalInt(GetModule(), "nCut10Skipped") != 1)
    {
        SetCameraFacing(fFacing, fZoom, -1.0, CAMERA_TRANSITION_TYPE_SLOW);
    }
}
void PlayAni(int nAnimation, float fLength)
{
    if (GetLocalInt(GetModule(), "nCut10Skipped") != 1)
    {
        SetCommandable( TRUE );
        PlayAnimation(nAnimation, 1.0, fLength);
        SetCommandable( FALSE );
    }
}
void Jump(object oPC, string sWay)
{
    if (GetLocalInt(GetModule(), "nCut10Skipped") != 1)
    {
        SetCommandable( TRUE, oPC );
        ActionJumpToObject(GetWaypointByTag(sWay));
        //SetCommandable( FALSE );
    }
}
void JumpMultiPlayer(string sWay)
{
    if (GetLocalInt(GetModule(), "nCut10Skipped") != 1)
    {
        object oPC = GetFirstObjectInArea(GetObjectByTag("cut10_university"));
        while (oPC != OBJECT_INVALID)
        {
            if (GetIsPC(oPC))
            {
                SetCommandable( TRUE, oPC );
                ActionJumpToObject(GetWaypointByTag(sWay));
            }
            oPC = GetNextObjectInArea(GetObjectByTag("cut10_university"));
        }
        //SetCommandable( FALSE );
    }
}
void Move(object oTarget)
{
    if (GetLocalInt(GetModule(), "nCut10Skipped") != 1)
    {
        SetCommandable( TRUE );
        ActionMoveToObject(oTarget);
        SetCommandable( FALSE );
    }
}








