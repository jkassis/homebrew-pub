package common

import (
	"context"

	"go.uber.org/zap"
)

// loggerKey is the key that holds the logger in the context
type loggerKey struct{}

// WithLogger returns a new context with the provided logger
func WithLogger(ctx context.Context, logger *zap.SugaredLogger) context.Context {
	return context.WithValue(ctx, loggerKey{}, logger)
}

// LoggerFromContext returns the logger from the context
func LoggerFromContext(ctx context.Context) *zap.SugaredLogger {
	logger, ok := ctx.Value(loggerKey{}).(*zap.SugaredLogger)
	if !ok {
		return nil
	}
	return logger
}
