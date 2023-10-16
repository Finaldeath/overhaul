//::///////////////////////////////////////////////
//:: act_q2rakabort
//:: FileName
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Checks the Global Boolean on the Rakata so that they change
    IF conversation is aborted AND the Rakshasa changed variable is set
*/

//:://////////////////////////////////////////////
//:: Created By: Drew Karpyshyn
//:: Created On: June 26, 2003
//:://////////////////////////////////////////////

void main()
{
   if (GetLocalInt(GetModule(),"RakshasaChanged")==99)

   {
        object oArea = GetArea(OBJECT_SELF);
     //Transform all Rakshasa
        ExecuteScript("act_q2rakattack", oArea);

        object oDjinn = GetObjectByTag("q2cdjinn");
        if (GetIsObjectValid(oDjinn) == TRUE)
        {
            AssignCommand(oDjinn, SpeakStringByStrRef(83946));
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), GetLocation(oDjinn));
            AssignCommand(oDjinn, ClearAllActions(TRUE));
            DestroyObject(oDjinn, 2.0);
        }
   }
}

