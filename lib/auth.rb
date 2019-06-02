class Auth
    def encode(payload)
        JWT.encode(payload, hmac_secret, 'HS256')
    end

    def decode(token)
        JWT.decode(
            token, hmac_secret,
            true, { algorithm: 'HS256'}
        ).first
    end

    private
        def hmac_secret
            ENV["AUTH_SECRET"] || '\x18\x9B\x1E\xF0R\xC6g8{\xBF\t\xFE\x81\x10\xD5y\xEBd\x8A\xF5\xF9?\xBA\xDC\x0
            E=\xFFq\xD0X\xF2\xF3'
        end
end
