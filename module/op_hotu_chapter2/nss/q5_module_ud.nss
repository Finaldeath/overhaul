
#include "x2c2_inc_plot"

void main()
{

    int nEvent = GetUserDefinedEventNumber();

    if(nEvent == 4554)
    {
        object oItem = GetLocalObject(OBJECT_SELF, "X2_ITEM_ACQUIRED");
        object oPC = GetLocalObject(OBJECT_SELF, "X2_ITEM_ACQUIRED_BY");

        if(GetTag(oItem) == "q5_StoneSlab")
        {
            if(GetPlot("q5_journal_beholders") == 1)
                SetPlot("q5_journal_beholders", 10);
        }

    }

}
