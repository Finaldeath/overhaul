#include "help_general"
#include "help_hench"
#include "nw_i0_generic"

void main()
{
    int nEvent = GetUserDefinedEventNumber();

    // DISCIPLES OF AKHANA SPAWNS
    if (nEvent == 1001)
    {
        object oPC = GetFirstPC();

        object oWP = GetNearestObjectByTag("WP_CT_UNIQ_AK_GHAS", oPC);
        location lWP = GetLocation(oWP);
        object oArea = GetArea(oWP);
        int bDoOnce = GetLocalInt(oArea, "bGHASARAN_SPAWNED_INTO_THIS_AREA");
        if (bDoOnce == FALSE)
        {
            //KH Nov 2004 - Clean these guys up incase of a worse case senario
            object oSpecial = GetObjectByTag("CT_UNIQ_AK_GHAS");
            AssignCommand(GetModule(), AssignCommand(oSpecial, SetIsDestroyable(TRUE, FALSE)));
            AssignCommand(GetModule(), DestroyObject(oSpecial, 1.0));
            oSpecial = GetObjectByTag("CT_COMM_AK_DISC", 0);
            AssignCommand(GetModule(), AssignCommand(oSpecial, SetIsDestroyable(TRUE, FALSE)));
            AssignCommand(GetModule(), DestroyObject(oSpecial, 1.0));
            oSpecial = GetObjectByTag("CT_COMM_AK_DISC", 1);
            AssignCommand(GetModule(), AssignCommand(oSpecial, SetIsDestroyable(TRUE, FALSE)));
            AssignCommand(GetModule(), DestroyObject(oSpecial, 1.0));

            //Spawning Ghasaran & disciples
            object oGhasaran = CreateObject(OBJECT_TYPE_CREATURE, "CT_UNIQ_AK_GHAS", lWP);
            int NUMB_OF_DISCIPLES = 2;
            int i;
            string s = "CT_COMM_AK_DISC";
            for (i = 1; i <= NUMB_OF_DISCIPLES; i++)
            {
                oWP = GetNearestObjectByTag("WP_" + s, oPC);
                lWP = GetLocation(oWP);
                CreateObject(OBJECT_TYPE_CREATURE, s, lWP);
            }

            //Flag the per-area DoOnce
            SetLocalInt(oArea, "bGHASARAN_SPAWNED_INTO_THIS_AREA", TRUE);
        }
    }

    // STAGE 0 KARA PRELUDE - DISCIPLES ATTACK PC AND KARA
    else if (nEvent == 1002)
    {
        object oPC = GetFirstPC();

        object oKara = GetNearestObjectByTag("HENCH_KARA", oPC);

        object oGhas = GetNearestObjectByTag("CT_UNIQ_AK_GHAS", oPC);

        //Make Ghasaran hostile (and remove his plot flag)
        SetPlotFlag(oGhas, FALSE);
        SetImmortal(oGhas, FALSE);
        ChangeToStandardFaction(oGhas, STANDARD_FACTION_HOSTILE);
        AssignCommand(oGhas, DetermineCombatRound(oKara));

        //Loop through the disciples in the area and turn them hostile.
        int iNth = 1;
        object oDisc = GetNearestObjectByTag("CT_COMM_AK_DISC", oPC, iNth);
        while (oDisc != OBJECT_INVALID)
        {
            SetPlotFlag(oDisc, FALSE);
            ChangeToStandardFaction(oDisc, STANDARD_FACTION_HOSTILE);
            AssignCommand(oDisc, DetermineCombatRound(oPC));

            //Update the loop variables
            iNth++;
            oDisc = GetNearestObjectByTag("CT_COMM_AK_DISC", oPC, iNth);
        }

/*
        AdjustReputation(oPC, oGhas, -100);

        AdjustReputation(oGhas, oPC, -100);

        AdjustReputation(oKara, oGhas, -100);

        AdjustReputation(oGhas, oKara, -100);

        object oDisc = GetFirstFactionMember(oGhas, FALSE);

        while (oDisc != OBJECT_INVALID)
        {
            if (GetArea(oDisc) == GetArea(oPC))
            {
                SetPlotFlag(oDisc, FALSE);

                int nRand = Random(100);

                object oTarget;

                if (nRand > 50)
                    oTarget = oPC;

                else
                    oTarget = oKara;

                AssignCommand(oDisc, DetermineCombatRound(oTarget));

                AssignCommand(oKara, DetermineCombatRound(oGhas));
            }

            oDisc = GetNextFactionMember(oGhas, FALSE);
        }
*/
    }
}
