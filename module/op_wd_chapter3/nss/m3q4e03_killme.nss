// * Kills thecreatureand leaves its body lying around

void main()
{
    if (GetIsDead(OBJECT_SELF) == FALSE)
    {
       SetIsDestroyable(FALSE);
       effect eDeath = EffectDeath();
       ApplyEffectToObject(DURATION_TYPE_PERMANENT, eDeath, OBJECT_SELF);
   }
}
