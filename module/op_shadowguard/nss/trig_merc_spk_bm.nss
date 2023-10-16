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
            object oMerch = GetNearestObjectByTag("CT_COMM_NT_MRBM");
            string sName = GetName(oMerch);

            switch (GetLocalInt(GetModule(), "N_MODULE_STAGE"))
            {
                case 0:
                    s = "Psst...  you there.  Having trouble finding what you need?  Perhaps " + sName + " can give you a hand in finding just what you're looking for...";
                    break;

                default:
                    s = "[BUG!!  NEED TO FILL IN SPEECH FOR MERCHANT HERE!!]";
                    break;
            }

            SceneSpeak(oMerch, s);
        }
    }
}
