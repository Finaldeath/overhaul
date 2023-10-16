//::///////////////////////////////////////////////
//:: Name
//:: FileName  q2b_spin_anticlk
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     When clicked on - the corresponding
     gargoyole will turn 30 degrees anti clockwise.
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  Dec 10/02
//:://////////////////////////////////////////////

void OpenDoor();

void main()
{
    float fCurrentFacing = GetFacing(OBJECT_SELF);
    fCurrentFacing = fCurrentFacing - 30.0;

    //Apply Correction for small floating point errors
    if (fCurrentFacing > 28.0 && fCurrentFacing < 32.0)
    {
        fCurrentFacing = 30.0;
        SetFacing(fCurrentFacing);
    }
    else if (fCurrentFacing > 58.0 && fCurrentFacing < 65.0)
    {
        fCurrentFacing = 60.0;
        SetFacing(fCurrentFacing);
    }
    else if (fCurrentFacing > 88.0 && fCurrentFacing < 92.0)
    {
        fCurrentFacing = 90.0;
        SetFacing(fCurrentFacing);
    }
    else if (fCurrentFacing > 118.0 && fCurrentFacing < 122.0)
    {
        fCurrentFacing = 120.0;
        SetFacing(fCurrentFacing);
    }
    else if (fCurrentFacing > 148.0 && fCurrentFacing < 152.0)
    {
        fCurrentFacing = 150.0;
        SetFacing(fCurrentFacing);
    }
    else if (fCurrentFacing > 178.0 && fCurrentFacing < 189.0)
    {
        fCurrentFacing = 180.0;
        SetFacing(fCurrentFacing);
    }
    else if (fCurrentFacing > 208.0 && fCurrentFacing < 212.0)
    {
        fCurrentFacing = 210.0;
        SetFacing(fCurrentFacing);
    }
    else if (fCurrentFacing > 238.0 && fCurrentFacing < 245.0)
    {
        fCurrentFacing = 240.0;
        SetFacing(fCurrentFacing);
    }
    else if (fCurrentFacing > 268.0 && fCurrentFacing < 272.0)
    {
        fCurrentFacing = 270.0;
        SetFacing(fCurrentFacing);
    }
    else if (fCurrentFacing > 298.0 && fCurrentFacing < 310.0)
    {
        fCurrentFacing = 300.0;
        SetFacing(fCurrentFacing);

    }
    else if (fCurrentFacing > 328.0 && fCurrentFacing < 332.0)
    {
        fCurrentFacing = 330.0;
        SetFacing(fCurrentFacing);
    }
    else if (fCurrentFacing > 358.0 && fCurrentFacing < 370.0)
    {
        fCurrentFacing = 0.0;
        SetFacing(fCurrentFacing);
    }
    else if (fCurrentFacing > -35.0 && fCurrentFacing < -25.0)
    {
        fCurrentFacing = 330.0;
        SetFacing(fCurrentFacing);
    }

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
        if (fCurrentFacing < 155.0 || fCurrentFacing > 145.0)
        {
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectBeam(VFX_BEAM_COLD, oGarg1, BODY_NODE_CHEST), oDoor);
            SetLocalInt(GetModule(), "X2_nGarg1Hit", 1);
            //check to see if all 3 gargs are properly aimed
            if (GetLocalInt(GetModule(), "X2_nGarg2Hit") == 1 && GetLocalInt(GetModule(), "X2_nGarg3Hit") == 1)
            {
                OpenDoor();
            }
        }
        /*else
        {
            SetLocalInt(GetModule(), "X2_nGarg1Hit", 0);
            eBeam = GetFirstEffect(oDoor);
            while(GetIsEffectValid(eBeam))
            {
                if (GetEffectCreator(eBeam) == oGarg1)
                {
                    RemoveEffect(oDoor, eBeam);
                }
                eBeam = GetNextEffect(oDoor);
            }

        }*/
    }
    else if (GetStringRight(GetTag(OBJECT_SELF), 1) == "2")
    {
        //success - activate beam - check for door openning.
        if (fCurrentFacing < 185.0 || fCurrentFacing > 175.0)
        {
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectBeam(VFX_BEAM_COLD, oGarg2, BODY_NODE_CHEST), oDoor);
            SetLocalInt(GetModule(), "X2_nGarg2Hit", 1);
            //check to see if all 3 gargs are properly aimed
            if (GetLocalInt(GetModule(), "X2_nGarg1Hit") == 1 && GetLocalInt(GetModule(), "X2_nGarg3Hit") == 1)
            {
                OpenDoor();
            }
        }
        /*else
        {
            SetLocalInt(GetModule(), "nGarg2Hit", 0);
            eBeam = GetFirstEffect(oDoor);
            while(GetIsEffectValid(eBeam))
            {
                if (GetEffectCreator(eBeam) == oGarg1)
                {
                    RemoveEffect(oDoor, eBeam);
                }
                eBeam = GetNextEffect(oDoor);
            }
        }*/

    }
    else if (GetStringRight(GetTag(OBJECT_SELF), 1) == "3")
    {
        //success - activate beam - check for door openning.
        if (fCurrentFacing < 215.0 || fCurrentFacing > 205.0)
        {
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectBeam(VFX_BEAM_COLD, oGarg3, BODY_NODE_CHEST), oDoor);
            SetLocalInt(GetModule(), "X2_nGarg3Hit", 1);
            //check to see if all 3 gargs are properly aimed
            if (GetLocalInt(GetModule(), "X2_nGarg1Hit") == 1 && GetLocalInt(GetModule(), "X2_nGarg2Hit") == 1)
            {
                OpenDoor();
            }
        }
        /*else
        {
            SetLocalInt(GetModule(), "nGarg3Hit", 0);
            eBeam = GetFirstEffect(oDoor);
            while(GetIsEffectValid(eBeam))
            {
                if (GetEffectCreator(eBeam) == oGarg1)
                {
                    RemoveEffect(oDoor, eBeam);
                }
                eBeam = GetNextEffect(oDoor);
            }
        }*/
    }

    //If all 3 gargs are facing the correct way - unlock and open the door

}

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
}
