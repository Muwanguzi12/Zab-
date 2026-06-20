export default function ZabLogo({ size = 36, withWordmark = true }) {
  return (
    <div style={{ display: 'flex', alignItems: 'center', gap: 10 }}>
      <img src="/logo.png" alt="ZAB Logo" width={size} height={size} style={{ borderRadius: '18px' }} />
      {withWordmark && (
        <span style={{ fontFamily: 'var(--font-display)', fontWeight: 700, fontSize: size * 0.55, color: '#F5F3FF', letterSpacing: '-0.02em' }}>
          ZAB
        </span>
      )}
    </div>
  );
}
