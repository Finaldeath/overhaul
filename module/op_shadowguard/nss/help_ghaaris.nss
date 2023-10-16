#include "help_hench"

void ReturnPC(object oPC)
{
    SetCommandable(TRUE, oPC);

    location l = GetLocalLocation(oPC, "LOC_FB_RETURN_LOC");

    AssignCommand(oPC, JumpToLocation(l));
}

void FlashBack1(object oPC)
{
    float offset = 6.0;

    object oOkaris = GetNearestObjectByTag("CT_UNIQ_GH_OKAR", oPC);

    AssignCommand(oOkaris, DelayCommand(1.0, SpeakString("You have entered FB1")));


    // Commands at end of Flashback
    DelayCommand(offset * 1, AddJournalSingle("JT_GHAARIS_OKARIS", 3, oPC));

    DelayCommand(offset * 1, ReturnPC(oPC));
}

void FlashBack2(object oPC)
{

}

void FlashBack3(object oPC)
{

}

void FlashBack4(object oPC)
{

}

void FlashBack5(object oPC)
{

}

void FlashBack6(object oPC)
{

}

void DoGhaarisFlashBack(object oPC, int n)
{
    SetCommandable(FALSE, oPC);

    switch (n)
    {
        case 1:
            FlashBack1(oPC);
            break;

        case 2:
            FlashBack2(oPC);
            break;

        case 3:
            FlashBack3(oPC);
            break;

        case 4:
            FlashBack4(oPC);
            break;

        case 5:
            FlashBack5(oPC);
            break;

        case 6:
            FlashBack6(oPC);
            break;
    }
}
