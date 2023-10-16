//::///////////////////////////////////////////////
//:: Name
//:: FileName  q2b_run_gargtrap
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This script will execute one iteration of the
     gargoyle trap.  All three gargoyle statues (or at
     least, any surviving gargoyle statues) will
     perform a 10 second countdown.
     Every two seconds another pair of lamp posts
     will light up.  At the end of the ten seconds,
     the remaining gargoyle statues will fire an
     area effect spell in the direction they are
     currently facing.
     Then all statues and spinners will revert to
     their original direction and all lamp posts
     will turn off.
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  Nov 5/02
//:://////////////////////////////////////////////
#include "nw_i0_generic"
void StatueFire(object oStatue, int nSpell);
void CreateBeam(string szBeam, string szWaypoint);
void OpenDoor();
void SpinGargs();

void main()
{
    if ( GetLocalInt(GetModule(), "nQ2BGARGTRAPACTIVE") == 1)
    {
        //TRAP OBJECTS
        SetLocalInt(GetModule(), "q2bTrapRunning", 1);
        object oGarg1 = GetObjectByTag("q2b_garg_1");
        object oGarg2 = GetObjectByTag("q2b_garg_2");
        object oGarg3 = GetObjectByTag("q2b_garg_3");

        object oLight1 = GetObjectByTag("q2b_light1");
        object oLight2 = GetObjectByTag("q2b_light2");
        object oLight3 = GetObjectByTag("q2b_light3");
        object oLight4 = GetObjectByTag("q2b_light4");
        object oLight5 = GetObjectByTag("q2b_light5");
        object oLight6 = GetObjectByTag("q2b_light6");
        object oLight7 = GetObjectByTag("q2b_light7");
        object oLight8 = GetObjectByTag("q2b_light8");
        object oLight9 = GetObjectByTag("q2b_light9");
        object oLight10 = GetObjectByTag("q2b_light10");



        //Activate lights two at a time.
        DelayCommand(4.0, CreateBeam("q2b_sol_green", "wp_q2b_sol1"));
        DelayCommand(4.0, CreateBeam("q2b_sol_green", "wp_q2b_sol2"));

        DelayCommand(8.0, CreateBeam("q2b_sol_green", "wp_q2b_sol3"));
        DelayCommand(8.0, CreateBeam("q2b_sol_green", "wp_q2b_sol4"));

        DelayCommand(12.0, CreateBeam("q2b_sol_yellow", "wp_q2b_sol5"));
        DelayCommand(12.0, CreateBeam("q2b_sol_yellow", "wp_q2b_sol6"));

        DelayCommand(16.0, CreateBeam("q2b_sol_yellow", "wp_q2b_sol7"));
        DelayCommand(16.0, CreateBeam("q2b_sol_yellow", "wp_q2b_sol8"));

        DelayCommand(20.0, CreateBeam("q2b_sol_red", "wp_q2b_sol9"));
        DelayCommand(20.0, CreateBeam("q2b_sol_red", "wp_q2b_sol10"));

        //After this much time - rotate gargoyles to original facing

        //DelayCommand(10.5, AssignCommand(oGarg1, StatueFire(oGarg1, SPELL_FIREBALL)));
        //DelayCommand(10.5, AssignCommand(oGarg2, StatueFire(oGarg2, SPELL_FIREBALL)));
        //DelayCommand(10.5, AssignCommand(oGarg3, StatueFire(oGarg3, SPELL_FIREBALL)));
        //cone of cold
        // cone of fire
        // cone of acid

        //Have the gargoyles spin randomly if not in position
        DelayCommand(20.0, SpinGargs());

        DelayCommand(20.0, SetLocalInt(GetModule(), "q2bTrapRunning", 0));
    }

}

void StatueFire(object oStatue, int nSpell)
{
    //Create a target 10 meters in front of wherever the gargoyle is currently facing

    //Gargoyle target information
    if (GetIsObjectValid(oStatue))
    {

        vector vStart1 = GetPosition(oStatue);
        vector vTarget1;
        vTarget1.x = vStart1.x + cos(GetFacing(oStatue)+ 180.0) * (IntToFloat(Random(20) + 2));
        vTarget1.y = vStart1.y + sin(GetFacing(oStatue)+ 180.0) * (IntToFloat(Random(20) + 2));
        vTarget1.z = 0.0;
        location lTarget1 = Location(GetArea(oStatue), vTarget1, 0.0);

        AssignCommand(oStatue, ActionCastSpellAtLocation(nSpell, lTarget1, METAMAGIC_ANY, TRUE));




    }

}

void CreateBeam(string szBeam, string szWaypoint)
{
    object oBeam = CreateObject(OBJECT_TYPE_PLACEABLE, szBeam, GetLocation(GetObjectByTag(szWaypoint)));
    DestroyObject(oBeam, 2.0);
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

void SpinGargs()
{
    if (GetLocalInt(GetModule(), "X2_Q2BSGargTrapDone") != 1)
    {
        //Create some incentive for the PC to hurry up (if the bombmaker is still alive)
        //Maximum 7 skeleton bombers in existance at once..
        if (GetLocalInt(GetModule(), "X2_Q2BBombmakerDead") != 1)
        {
            if (GetLocalInt(GetModule(), "X2_Q2BBombers") < 5)
            {
                SetLocalInt(GetModule(), "X2_Q2BBombers", GetLocalInt(GetModule(), "X2_Q2BBombers") + 1);
                object oSpawnPoint = GetWaypointByTag("wp_q2bs_gargtrap_spawn");
                effect eSpawn = EffectVisualEffect(VFX_IMP_RAISE_DEAD);
                ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eSpawn, GetLocation(oSpawnPoint));
                object oSkelly = CreateObject(OBJECT_TYPE_CREATURE, "x2_q2_skelbomb", GetLocation(oSpawnPoint), TRUE);
                AssignCommand(oSkelly, DetermineCombatRound());
            }
        }
        //Gargoyles (for emitting beams)
        object oGarg;
        //Target door
        object oDoor = GetObjectByTag("q2b06_door");
        //beam effects
        effect eBeam;
        effect eGlobe = EffectVisualEffect(VFX_IMP_GLOBE_USE);

        int nCount;
        float fCurrentFacing;
        float fNewFacing;

        //object oPC = GetFirstPC();

        //Spin each gargoyle statue that's not locked down
        for (nCount = 1; nCount < 4; nCount++)
        {
            oGarg = GetObjectByTag("q2b_garg_" + IntToString(nCount));
            //Do nothing if the gargoyle has been locked in place
            if (GetLocalInt(oGarg, "nLocked") == 0)
            {

                fCurrentFacing = GetFacing(oGarg);
                fNewFacing = IntToFloat(Random(360));
                fCurrentFacing = fNewFacing;


                //Apply Correction for small floating point errors
                if (fCurrentFacing < 20.0)
                {
                    fCurrentFacing = 0.0;
                }
                else if (fCurrentFacing >= 20.0 && fCurrentFacing < 40.0)
                {
                    fCurrentFacing = 30.0;
                }
                else if (fCurrentFacing >= 40.0 && fCurrentFacing < 70.0)
                {
                    fCurrentFacing = 60.0;
                }
                else if (fCurrentFacing >= 70.0 && fCurrentFacing < 100.0)
                {
                    fCurrentFacing = 90.0;
                }
                else if (fCurrentFacing >= 100.0 && fCurrentFacing < 130.0)
                {
                    fCurrentFacing = 120.0;
                }
                else if (fCurrentFacing >= 130.0 && fCurrentFacing < 160.0)
                {
                    fCurrentFacing = 150.0;
                }
                else if (fCurrentFacing >= 160.0 && fCurrentFacing < 190.0)
                {
                    fCurrentFacing = 180.0;
                }
                else if (fCurrentFacing >= 190.0 && fCurrentFacing < 220.0)
                {
                    fCurrentFacing = 210.0;
                }
                else if (fCurrentFacing >= 220.0 && fCurrentFacing < 250.0)
                {
                    fCurrentFacing = 240.0;
                }
                else if (fCurrentFacing >= 250.0 && fCurrentFacing < 280.0)
                {
                    fCurrentFacing = 270.0;
                }
                else if (fCurrentFacing >= 280.0 && fCurrentFacing < 310.0)
                {
                    fCurrentFacing = 300.0;
                }
                else if (fCurrentFacing >= 310.0 && fCurrentFacing < 340.0)
                {
                    fCurrentFacing = 330.0;
                }
                else if (fCurrentFacing >= 340.0 && fCurrentFacing < 370.0)
                {
                    fCurrentFacing = 0.0;
                }


                ApplyEffectToObject(DURATION_TYPE_INSTANT, eGlobe, oGarg);
                PlaySound("as_cv_brickscrp1");
                AssignCommand(oGarg, SetFacing(fCurrentFacing));


                //Check to see if gargoyle is facing the correct way - if so start a beam,
                //if not - destroy any beam that was there and close and lock the door
                if (GetStringRight(GetTag(oGarg), 1) == "1")
                {

                    //success - activate beam - check for door openning.
                    if (fCurrentFacing < 155.0 && fCurrentFacing > 145.0)
                    {
                        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectBeam(VFX_BEAM_COLD, oDoor, BODY_NODE_CHEST), oGarg);
                        SetLocalInt(GetModule(), "X2_nGarg1Hit", 1);
                        //check to see if all 3 gargs are properly aimed
                        if (GetLocalInt(GetModule(), "X2_nGarg2Hit") == 1 && GetLocalInt(GetModule(), "X2_nGarg3Hit") == 1)
                        {
                            DelayCommand(1.0, OpenDoor());
                        }
                    }
                    else
                    {
                        SetLocalInt(GetModule(), "X2_nGarg1Hit", 0);
                        eBeam = GetFirstEffect(oGarg);
                        while(GetIsEffectValid(eBeam))
                        {
                            //if (GetTag(GetEffectCreator(eBeam)) == GetTag(oGarg))
                            //{
                                RemoveEffect(oGarg, eBeam);

                            //}
                            eBeam = GetNextEffect(oGarg);
                        }

                    }
                }
                else if (GetStringRight(GetTag(oGarg), 1) == "2")
                {

                    //success - activate beam - check for door openning.
                    if (fCurrentFacing < 185.0 && fCurrentFacing > 175.0)
                    {
                        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectBeam(VFX_BEAM_COLD, oDoor, BODY_NODE_CHEST), oGarg);
                        SetLocalInt(GetModule(), "X2_nGarg2Hit", 1);
                        //check to see if all 3 gargs are properly aimed
                        if (GetLocalInt(GetModule(), "X2_nGarg1Hit") == 1 && GetLocalInt(GetModule(), "X2_nGarg3Hit") == 1)
                        {
                            DelayCommand(1.0, OpenDoor());
                        }
                    }
                    else
                    {
                        SetLocalInt(GetModule(), "X2_nGarg2Hit", 0);
                        eBeam = GetFirstEffect(oGarg);
                        while(GetIsEffectValid(eBeam))
                        {
                            //if (GetTag(GetEffectCreator(eBeam)) == GetTag(oGarg))
                            //{
                                RemoveEffect(oGarg, eBeam);

                            //}
                            eBeam = GetNextEffect(oGarg);
                        }

                    }
                }
                else if (GetStringRight(GetTag(oGarg), 1) == "3")
                {

                    //success - activate beam - check for door openning.
                    if (fCurrentFacing < 215.0 && fCurrentFacing > 205.0)
                    {
                        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectBeam(VFX_BEAM_COLD, oDoor, BODY_NODE_CHEST), oGarg);
                        SetLocalInt(GetModule(), "X2_nGarg3Hit", 1);
                        //check to see if all 3 gargs are properly aimed
                        if (GetLocalInt(GetModule(), "X2_nGarg1Hit") == 1 && GetLocalInt(GetModule(), "X2_nGarg2Hit") == 1)
                        {
                            DelayCommand(1.0, OpenDoor());
                        }
                    }
                    else
                    {
                        SetLocalInt(GetModule(), "X2_nGarg3Hit", 0);
                        eBeam = GetFirstEffect(oGarg);
                        while(GetIsEffectValid(eBeam))
                        {
                            //if (GetTag(GetEffectCreator(eBeam)) == GetTag(oGarg))
                            //{
                                RemoveEffect(oGarg, eBeam);

                            //}
                            eBeam = GetNextEffect(oGarg);
                        }

                    }

                }
            }
        }

    }


}
