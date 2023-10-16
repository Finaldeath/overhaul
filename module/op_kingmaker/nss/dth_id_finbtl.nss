//:://////////////////////////////////////////////////
//:: Custom Intel Devourer script for on_death
//:://////////////////////////////////////////////////
//:: Copyright (c) 2004 Bioware
//:: Created By: Keith K2 Hayward
//:://////////////////////////////////////////////////

void main()
{
    object oIllithid = GetNearestObjectByTag("q3_illithid");
    effect eEffect = GetFirstEffect(oIllithid);

    while (GetIsEffectValid(eEffect) == TRUE)
    {
        if (GetEffectCreator(eEffect) == OBJECT_SELF)
        {
            RemoveEffect(oIllithid, eEffect);
        }

        eEffect = GetNextEffect(oIllithid);
    }
}
