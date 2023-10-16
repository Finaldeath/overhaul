//::///////////////////////////////////////////////
//:: Name
//:: FileName  q2b_spin_clck
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     When clicked on - the corresponding
     gargoyole will turn 30 degrees clockwise.
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  Dec 10/02
//:://////////////////////////////////////////////

void OpenDoor();

void main()
{


    object oPC = GetLastUsedBy();

    if (GetLocalInt(GetModule(), "X2_Q2BSGargTrapDone") == 1)
    {
        FloatingTextStrRefOnCreature(84128 , oPC);
        return;
    }
    //Do nothing if the gargoyle has been locked in place
    if (GetLocalInt(OBJECT_SELF, "nLocked") == 1)
    {
        FloatingTextStrRefOnCreature(84129 , oPC);
        return;
    }



    float fCurrentFacing = GetFacing(OBJECT_SELF);
    fCurrentFacing = fCurrentFacing + 30.0;
    //Apply Correction for small floating point errors
    if (fCurrentFacing > 20.0 && fCurrentFacing < 40.0)
    {
        fCurrentFacing = 30.0;
    }
    else if (fCurrentFacing > 50.0 && fCurrentFacing < 70.0)
    {
        fCurrentFacing = 60.0;
    }
    else if (fCurrentFacing > 80.0 && fCurrentFacing < 100.0)
    {
        fCurrentFacing = 90.0;
    }
    else if (fCurrentFacing > 110.0 && fCurrentFacing < 130.0)
    {
        fCurrentFacing = 120.0;
    }
    else if (fCurrentFacing > 140.0 && fCurrentFacing < 160.0)
    {
        fCurrentFacing = 150.0;
    }
    else if (fCurrentFacing > 170.0 && fCurrentFacing < 190.0)
    {
        fCurrentFacing = 180.0;
    }
    else if (fCurrentFacing > 200.0 && fCurrentFacing < 220.0)
    {
        fCurrentFacing = 210.0;
    }
    else if (fCurrentFacing > 230.0 && fCurrentFacing < 250.0)
    {
        fCurrentFacing = 240.0;
    }
    else if (fCurrentFacing > 260.0 && fCurrentFacing < 280.0)
    {
        fCurrentFacing = 270.0;
    }
    else if (fCurrentFacing > 290.0 && fCurrentFacing < 320.0)
    {
        fCurrentFacing = 300.0;
    }
    else if (fCurrentFacing > 320.0 && fCurrentFacing < 340.0)
    {
        fCurrentFacing = 330.0;
    }
    else if (fCurrentFacing > 350.0 && fCurrentFacing < 370.0)
    {
        fCurrentFacing = 0.0;
    }
    else if (fCurrentFacing > -40.0 && fCurrentFacing < -20.0)
    {
        fCurrentFacing = 330.0;
    }
    PlaySound("as_cv_brickscrp1");
    SetFacing(fCurrentFacing);
    //DEBUG

    //Target door
    object oDoor = GetObjectByTag("q2b06_door");
    //Gargoyles (for emitting beams)
    object oGarg1 = GetObjectByTag("q2b_garg_1");
    object oGarg2 = GetObjectByTag("q2b_garg_2");
    object oGarg3 = GetObjectByTag("q2b_garg_3");

    //beam effects
    effect eBeam;

    //Check to see if gargoyle is facing the correct way - if so start a beam,
    //if not - destroy any beam that was there and close and lock the door
    if (GetStringRight(GetTag(OBJECT_SELF), 1) == "1")
    {
        //success - activate beam - check for door openning.
        if (fCurrentFacing < 155.0 && fCurrentFacing > 145.0)
        {
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectBeam(VFX_BEAM_COLD, oDoor, BODY_NODE_CHEST), oGarg1);
            SetLocalInt(GetModule(), "X2_nGarg1Hit", 1);
            //Set a variable on the Gargoyle that it is lockable.
            SetLocalInt(OBJECT_SELF, "nLockable", 1);
            //check to see if all 3 gargs are properly aimed
            if (GetLocalInt(GetModule(), "X2_nGarg2Hit") == 1 && GetLocalInt(GetModule(), "X2_nGarg3Hit") == 1)
            {
                DelayCommand(1.0, OpenDoor());
            }
        }
        else
        {
            SetLocalInt(GetModule(), "X2_nGarg1Hit", 0);
            //Set a variable that the Gargoyle is not lockable
            SetLocalInt(OBJECT_SELF, "nLockable", 0);
            eBeam = GetFirstEffect(oGarg1);
            while(GetIsEffectValid(eBeam))
            {
                //if (GetTag(GetEffectCreator(eBeam)) == GetTag(oGarg1))
                //{
                    RemoveEffect(oGarg1, eBeam);

                //}
                eBeam = GetNextEffect(oGarg1);
            }
        }
    }
    else if (GetStringRight(GetTag(OBJECT_SELF), 1) == "2")
    {
        //success - activate beam - check for door openning.
        if (fCurrentFacing < 185.0 && fCurrentFacing > 175.0)
        {
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectBeam(VFX_BEAM_COLD, oDoor, BODY_NODE_CHEST), oGarg2);
            SetLocalInt(GetModule(), "X2_nGarg2Hit", 1);
            //Set a variable on the Gargoyle that it is lockable.
            SetLocalInt(OBJECT_SELF, "nLockable", 1);
            //check to see if all 3 gargs are properly aimed
            if (GetLocalInt(GetModule(), "X2_nGarg1Hit") == 1 && GetLocalInt(GetModule(), "X2_nGarg3Hit") == 1)
            {
                DelayCommand(1.0, OpenDoor());
            }
        }
        else
        {

            SetLocalInt(GetModule(), "X2_nGarg2Hit", 0);
            //Set a variable on the Gargoyle that it is NOT lockable.
            SetLocalInt(OBJECT_SELF, "nLockable", 0);
            eBeam = GetFirstEffect(oGarg2);
            while(GetIsEffectValid(eBeam))
            {
                //if (GetTag(GetEffectCreator(eBeam)) == GetTag(oGarg2))
                //{
                    RemoveEffect(oGarg2, eBeam);
                //}
                eBeam = GetNextEffect(oGarg2);
            }
        }
    }
    else if (GetStringRight(GetTag(OBJECT_SELF), 1) == "3")
    {
        //success - activate beam - check for door openning.
        if (fCurrentFacing < 215.0 && fCurrentFacing > 205.0)
        {
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectBeam(VFX_BEAM_COLD, oDoor, BODY_NODE_CHEST), oGarg3);
            //Set a variable on the Gargoyle that it is lockable.
            SetLocalInt(OBJECT_SELF, "nLockable", 1);
            SetLocalInt(GetModule(), "X2_nGarg3Hit", 1);
            //check to see if all 3 gargs are properly aimed
            if (GetLocalInt(GetModule(), "X2_nGarg1Hit") == 1 && GetLocalInt(GetModule(), "X2_nGarg2Hit") == 1)
            {
                DelayCommand(1.0, OpenDoor());
            }
        }
        else
        {
            //Set a variable on the Gargoyle that it is NOT lockable.
            SetLocalInt(OBJECT_SELF, "nLockable", 1);

            SetLocalInt(GetModule(), "X2_nGarg3Hit", 0);
            eBeam = GetFirstEffect(oGarg3);
            while(GetIsEffectValid(eBeam))
            {
                //if (GetTag(GetEffectCreator(eBeam)) == GetTag(oGarg3))
                //{
                    RemoveEffect(oGarg3, eBeam);
                //}
                eBeam = GetNextEffect(oGarg3);
            }
        }
    }
}

//If all 3 gargs are facing the correct way - unlock and open the door
void OpenDoor()
{
    object oDoor = GetObjectByTag("q2b06_door");
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_METEOR_SWARM), GetLocation(oDoor));
    SetLocked(oDoor, FALSE);
    SetLocalInt(oDoor, "nDoorBlocked",2);
    AssignCommand(oDoor,SpeakOneLinerConversation());
    AssignCommand(oDoor, ActionOpenDoor(oDoor));
    SetLocalInt(GetModule(),"nQ2BGARGTRAPACTIVE", 0);
    DestroyObject(oDoor);
    object oGarg1 = GetObjectByTag("q2b_garg_1");
    object oGarg2 = GetObjectByTag("q2b_garg_2");
    object oGarg3 = GetObjectByTag("q2b_garg_3");
    //Kill the beam effects
    effect eBeam = GetFirstEffect(oGarg1);
    while(GetIsEffectValid(eBeam))
    {
        RemoveEffect(oGarg1, eBeam);
        eBeam = GetNextEffect(oGarg1);
    }
    eBeam = GetFirstEffect(oGarg2);
    while(GetIsEffectValid(eBeam))
    {
        RemoveEffect(oGarg2, eBeam);
        eBeam = GetNextEffect(oGarg2);
    }
    eBeam = GetFirstEffect(oGarg3);
    while(GetIsEffectValid(eBeam))
    {
        RemoveEffect(oGarg3, eBeam);
        eBeam = GetNextEffect(oGarg3);
    }
    SetLocalInt(GetModule(), "X2_Q2BSGargTrapDone", 1);
}
