//Commoner 3 faces piper and does animation
void main()
{
    object oPiper = GetObjectByTag("q1gpiper");
    object oCommoner = GetObjectByTag("q1g_pip_common3");
    AssignCommand(oCommoner, SetFacingPoint(GetPosition(oPiper)));
    AssignCommand(oCommoner, ActionPlayAnimation(ANIMATION_FIREFORGET_BOW));
}
