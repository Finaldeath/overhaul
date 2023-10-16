const string sWarn001 = "What are you doing!? I am your enemy, attack ME!!";
const string sWarn002 = "Stop it! Stop attacking my pets!";
const string sWarn003 = "ME! Focus your attacks on ME you weaklings!";
const string sWarn004 = "Why won't you listen!? Obey me! Attack me!";

//:://////////////////////////////////////////////////
//:: ndm_kmdevour
//:: OnDamaged handler
//:://////////////////////////////////////////////////
/*
    If you hit an Intellect Devourer have the
    Illithid make mention.
*/
//:://////////////////////////////////////////////////
//:: Created By: Keith K2 Hayward
//:: Created On: Nov 25
//:://////////////////////////////////////////////////

void main()
{
    object oIllithid = GetNearestObjectByTag("q3_illithid");
    int iFlag = GetLocalInt(oIllithid, "q3_illithid");

    // have the Illithid shout somthing
    if ((Random(4) != 0) && (iFlag < 4))
    {
        SetLocalInt(oIllithid, "q3_illithid", (iFlag + 1));
        if (iFlag == 0)
            AssignCommand(oIllithid, SpeakString(sWarn001));
        if (iFlag == 1)
            AssignCommand(oIllithid, SpeakString(sWarn002));
        if (iFlag == 2)
            AssignCommand(oIllithid, SpeakString(sWarn003));
        if (iFlag == 3)
            AssignCommand(oIllithid, SpeakString(sWarn004));
    }

    ExecuteScript("nw_c2_default6", OBJECT_SELF);
}
