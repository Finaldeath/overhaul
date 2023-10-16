//::///////////////////////////////////////////////
//:: m2q3J Holy Urn
//:: m2q3J_Urn
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Spawns in a random divine scroll.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Jan 25, 2002
//:://////////////////////////////////////////////

void main()
{
    int iOneTime = GetLocalInt(OBJECT_SELF, "OneTime");
    int iScroll = Random(10)+1;

    if (iOneTime == FALSE)
    {
        SetLocalInt(OBJECT_SELF, "OneTime", TRUE);

        switch (iScroll)
        {
            case 1: //Lesser Restoration
            {
                CreateItemOnObject("NW_IT_SPDVSCR201");
            }
            break;

            case 2: //Charm Person or Animal
            {
                CreateItemOnObject("NW_IT_SPDVSCR202");
            }
            break;

            case 3: //Silence
            {
                CreateItemOnObject("NW_IT_SPDVSCR203");
            }
            break;

            case 4: //Remove Blindness
            {
                CreateItemOnObject("NW_IT_SPDVSCR301");
            }
            break;

            case 5: //Remove Disease
            {
                CreateItemOnObject("NW_IT_SPDVSCR302");
            }
            break;

            case 6: //Restoration
            {
                CreateItemOnObject("NW_IT_SPDVSCR401");
            }
            break;

            case 7: //Neutralize Poison
            {
                CreateItemOnObject("NW_IT_SPDVSCR402");
            }
            break;

            case 8: //Raise Dead
            {
                CreateItemOnObject("NW_IT_SPDVSCR501");
            }
            break;

            case 9: //Greater Restoration
            {
                CreateItemOnObject("NW_IT_SPDVSCR701");
            }
            break;

            case 10: //Resurrection
            {
                CreateItemOnObject("NW_IT_SPDVSCR702");
            }
            break;
        }
    }
}
