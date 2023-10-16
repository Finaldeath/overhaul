//Svirf drinks and staggers
void main()
{

    object oSvirf = GetObjectByTag("q2a3svirf");
    AssignCommand(oSvirf, ActionPlayAnimation(ANIMATION_FIREFORGET_DRINK));
    DelayCommand(3.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectDazed(), oSvirf));
}
