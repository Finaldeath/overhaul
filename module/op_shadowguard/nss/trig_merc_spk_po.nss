#include "help_general"

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        int nRand = Random(100);
        string s;


        // if PC's first time in the merchant trigger, always speaks message
        if (GetLocalInt(OBJECT_SELF, "N_DO_ONCE") == 0)
        {
            nRand = 0;
            SetLocalInt(OBJECT_SELF, "N_DO_ONCE", 1);
        }

        // 25 % chance that merchant will repeat their message
        if (nRand < 25)
        {
            object oMerch = GetNearestObjectByTag("CT_COMM_NT_MRPO");
            string sName = GetName(oMerch);

            switch (GetLocalInt(GetModule(), "N_MODULE_STAGE"))
            {
                case 0:
                    s = "In need of that special potion to cure your woes?  Searching for scrolls of the arcane arts?  Let " + sName + " serve your needs!";
                    break;

                default:
                    s = "[BUG!!  NEED TO FILL IN SPEECH FOR MERCHANT HERE!!]";
                    break;
            }

            SceneSpeak(oMerch, s);
        }
    }
}
