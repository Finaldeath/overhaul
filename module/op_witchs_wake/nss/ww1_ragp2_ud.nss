//::///////////////////////////////////////////////
//:: Witchwork 1: Ragpicker 2, UserDefined
//:: WW1_Ragp2_UD.nss
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
     OnDialog parses the original ragp creature
     for Success/Failure variables and transfers
     them here.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 18, 2002
//:://////////////////////////////////////////////

void main()
{
    //Process Default User-Defined Events
    int iUDNum = GetUserDefinedEventNumber();
    switch (iUDNum)
    {
        case 1001: //User-Defined Heartbeat Event
        {

        }
        break;

        case 1002: //User-Defined OnPerceive Event
        {

        }
        break;

        case 1003: //User-Defined EndCombatRound Event
        {

        }
        break;

        case 1004: //User-Defined OnDialog Event
        {
            string sResult2 = GetLocalString(OBJECT_SELF, "sWW_AbilityResult");

            if (sResult2 == "")
            {
                object oRagp1 = GetObjectByTag("Ragpicker");
                string sResult1 = GetLocalString(oRagp1, "sWW_AbilityResult");

                SetLocalString(OBJECT_SELF, "sWW_AbilityResult", sResult1);
            }
        }
        break;

        case 1005: //User-Defined OnAttack Event
        {

        }
        break;

        case 1006: //User-Defined OnDamaged Event
        {

        }
        break;

        case 1007: //User-Defined OnDeath Event
        {

        }
        break;

        case 1008: //User-Defined OnDisturbed Event
        {

        }
        break;
    }
}
